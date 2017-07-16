require "dry/web/container"

module TilWeb
  class Container < Dry::Web::Container
    configure do
      config.name = :til_web
      config.listeners = true
      config.default_namespace = "til_web"
      config.auto_register = %w[lib/til_web]
    end

    load_paths! "lib"
  end
end
