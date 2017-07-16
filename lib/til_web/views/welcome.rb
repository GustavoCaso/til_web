require "til_web/view/controller"

module TilWeb
  module Views
    class Welcome < TilWeb::View::Controller
      configure do |config|
        config.template = "welcome"
      end
    end
  end
end
