require 'til_web/repository'
require 'til_web/entities/author'

module TilWeb
  module Repositories
    class Authors < TilWeb::Repository[:authors]
      commands update: :by_pk

      def create(attrs)
        command(:authors)[:create].(attrs)
      end

      def [](id)
        authors.by_id(id).map_to(Entities::Author).one!
      end

      def by_email(email)
        authors.by_email(email).map_to(Entities::Author).one
      end
    end
  end
end
