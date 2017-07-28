require "til_web/view/controller"

module TilWeb
  module Views
    module Tils
      class New < TilWeb::View::Controller
        configure do |config|
          config.template = "tils/new"
        end

        expose :errors, default: []
      end
    end
  end
end
