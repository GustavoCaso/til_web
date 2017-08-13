# auto_register: false
require 'types'

module TilWeb
  module Entities
    class Author < Dry::Struct
      constructor_type :schema

      attribute :id, Types::Strict::Int
      attribute :name, Types::Strict::String
      attribute :email, Types::Strict::String
      attribute :password_digest, Types::Strict::String
      attribute :avatar_data, Types::String.optional

      attr_writer :avatar_data
    end
  end
end
