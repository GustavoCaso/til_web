require 'til_web/operation'
require 'til_web/import'
require 'til_web/validations/authors/create'
require 'dry/monads'

module TilWeb
  module Operations
    module Authors
      class Create < TilWeb::Operation

        include Import[
          'repositories.authors',
          'authentication.password_digest'
        ]

        def call(attributes)
          attr = Validations::Authors::Create.call(attributes)

          if attr.success?
            author = authors.create(prepare_attributes(attr.output))
            Dry::Monads::Right(author)
          else
            Dry::Monads::Left(attr.errors)
          end
        end

        private

        def prepare_attributes(attr)
          attr.merge(
            password_digest: password_digest.create(attr[:password])
          )
        end
      end
    end
  end
end
