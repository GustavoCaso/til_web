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
          validated_attribtes = Validations::Tils.(attributes)

          if validated_attribtes.success?
            til = tils.create(title: attributes['title'], text: attributes['text'])
            Dry::Monads::Right(til)
          else
            Dry::Monads::Left(validated_attribtes)
          end
        end
      end
    end
  end
end
