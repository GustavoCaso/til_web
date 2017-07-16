module Persistence
  module Relations
    class Authors < ROM::Relation[:sql]
      schema(:authors) do
        attribute :id, Types::Serial
        attribute :name, Types::Strict::String
        attribute :email, Types::Strict::String

        associations do
          has_many :tils
        end
      end

      def by_id(id)
        where(id: id)
      end

      def by_name(name)
        where(name: name)
      end

      def by_email(email)
        where(email: email)
      end
    end
  end
end
