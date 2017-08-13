require "til_web/view/controller"
require "til_web/import"
require 'til_web/decorators/author'

module TilWeb
  module Views
    module Authors
      class Show < TilWeb::View::Controller
        include Import['repositories.authors']


        configure do |config|
          config.template = "authors/show"
        end

        private_expose :id

        expose :author do |id|
          TilWeb::Decorators::Author.new(authors[id])
        end
      end
    end
  end
end
