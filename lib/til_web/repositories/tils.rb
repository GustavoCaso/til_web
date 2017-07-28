require 'til_web/repository'

module TilWeb
  module Repositories
    class Tils < TilWeb::Repository[:tils]
      def create(attrs)
        command(:tils)[:create].(attrs)
      end

      def listing
        tils
      end

      def [](id)
        tils.by_id(id).one!
      end

      def by_author(author_or_author_id)
        id = case author_or_author_id
               when Fixnum
                 author_or_author_id
               else
                 author_or_author_id.id
             end
        tils.by_author_id(id).to_a
      end
    end
  end
end
