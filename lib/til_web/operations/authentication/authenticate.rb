require 'til_web/import'
require 'til_web/operation'
require 'dry/monads'

module TilWeb
  module Operations
    module Authentication
      class Authenticate < TilWeb::Operation
        include Import[
          'repositories.authors',
          'authentication.password_digest'
        ]

        def call(email, password)
          author = authors.by_email(email)
          if author && password_digest.valid?(author.password_digest, password)
            Dry::Monads::Right(author)
          else
            Dry::Monads::Left(nil)
          end
        end
      end
    end
  end
end
