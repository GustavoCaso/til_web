require "dry/web/roda/application"
require_relative 'roda_plugins'
require_relative "container"

module TilWeb
  class Application < Dry::Web::Roda::Application
    configure do |config|
      config.container = Container
      config.routes = "web/routes".freeze
    end

    opts[:root] = Pathname(__FILE__).join("../..").realpath.dirname

    use Rack::MethodOverride
    use Rack::Session::Cookie, key: "til_web.session", secret: self["settings"].session_secret

    plugin :public
    plugin :assets, css: 'til_web.css'
    plugin :csrf, raise: true
    plugin :flash
    plugin :all_verbs
    plugin Roda::RodaPlugins::Logged
    plugin :dry_view

    def view_context
      current_user ? super.authorized(current_user) : super
    end

    def current_user
      env['current_user']
    end

    route do |r|
      r.public
      r.assets
      r.multi_route

      r.root do
        r.view "welcome"
      end
    end

    error do |e|
      self.class[:rack_monitor].instrument(:error, exception: e)
      raise e
    end

    load_routes!
  end
end
