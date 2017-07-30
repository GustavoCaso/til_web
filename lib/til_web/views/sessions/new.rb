require "til_web/view/controller"

module TilWeb
  module Views
    module Sessions
      class New < TilWeb::View::Controller
        configure do |config|
          config.template = "sessions/new"
        end
      end
    end
  end
end
