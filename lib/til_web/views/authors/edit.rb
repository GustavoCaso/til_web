require "til_web/view/controller"
require "til_web/import"

module TilWeb
  module Views
    module Authors
      class Edit < TilWeb::View::Controller
        include Import['repositories.authors']


        configure do |config|
          config.template = "authors/edit"
        end

        private_expose :id

        expose :author do |id|
          authors[id]
        end

        expose :errors, default: []
      end
    end
  end
end
