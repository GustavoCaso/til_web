module Persistence
  module Relations
    class Authors < ROM::Relation[:sql]
      schema(:authors) do
        attribute :id, Types::Serial
        attribute :name, Types::Strict::String
        attribute :email, Types::Strict::String
        attribute :password_digest, Types::Strict::String
        attribute :avatar_data, Types::Strict::String.optional
        attribute :created_at, Types::Date
        attribute :updated_at, Types::Date

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
