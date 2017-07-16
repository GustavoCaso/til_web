require 'til_web/repository'

module TilWeb
  module Repositories
    class Authors < TilWeb::Repository[:authors]
      def [](id)
        authors.by_id(id).one!
      end
    end
  end
end
