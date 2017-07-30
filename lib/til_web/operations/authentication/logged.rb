require 'til_web/import'
require 'til_web/operation'
require 'dry/monads'

module TilWeb
  module Operations
    module Authentication
      class Logged < TilWeb::Operation
        include Import['repositories.authors']

        def call(session)
          author_id = session[:author_id]
          if author_id
            Dry::Monads::Right(authors[author_id])
          else
            Dry::Monads::Left(nil)
          end
        end
      end
    end
  end
end
