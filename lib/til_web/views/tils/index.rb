require "til_web/view/controller"
require "til_web/import"

module TilWeb
  module Views
    module Tils
      class Index < TilWeb::View::Controller
        include Import['repositories.tils']


        configure do |config|
          config.template = "tils/index"
        end

        expose :tils do
          tils.listing
        end
      end
    end
  end
end
