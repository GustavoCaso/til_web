require 'til_web/repository'

module TilWeb
  module Repositories
    class Authors < TilWeb::Repository[:authors]
      def create(attrs)
        command(:authors)[:create].(attrs)
      end

      def [](id)
        authors.by_id(id).one!
      end

      def by_email(email)
        authors.by_email(email).first
      end
    end
  end
end
