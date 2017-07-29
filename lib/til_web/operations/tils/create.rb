require 'til_web/import'
require 'til_web/operation'
require "til_web/validations/tils"
require "dry/monads"

module TilWeb
  module Operations
    module Tils
      class Create < TilWeb::Operation
        include Import['repositories.tils']

        def call(attributes)
          validated_attributes = Validations::Tils.(attributes)

          if validated_attributes.success?
            til = tils.create(validated_attributes.output)
            Dry::Monads::Right(til)
          else
            Dry::Monads::Left(validated_attributes)
          end
        end
      end
    end
  end
end
