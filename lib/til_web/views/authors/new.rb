require 'til_web/view/controller'

module TilWeb
  module Views
    module Authors
      class New < TilWeb::View::Controller

        configure do |config|
          config.template = 'authors/new'
        end

        expose :errors, default: []
      end
    end
  end
end
