module Persistence
  module Relations
    class Tils < ROM::Relation[:sql]
      schema(:tils) do
        attribute :id, Types::Serial
        attribute :title, Types::Strict::String
        attribute :text, Types::Strict::String
        attribute :author_id, Types::ForeignKey(:authors)

        associations do
          belongs_to :author
        end
      end

      def by_id(id)
        where(id: id)
      end

      def by_author_id(author_id)
        where(author_id: author_id)
      end
    end
  end
end
