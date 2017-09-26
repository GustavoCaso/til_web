require "til_web/view/controller"
require "til_web/import"

module TilWeb
  module Views
    module Tils
      class Show < TilWeb::View::Controller
        include Import['repositories.tils']


        configure do |config|
          config.template = "tils/show"
        end

        expose :til do |id:|
          tils[id]
        end
      end
    end
  end
end
