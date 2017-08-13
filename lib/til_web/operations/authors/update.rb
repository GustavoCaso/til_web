require 'til_web/operation'
require 'til_web/import'
require 'til_web/container'
require 'til_web/validations/authors/update'
require 'dry/monads'

TilWeb::Container.boot! :shrine

module TilWeb
  module Operations
    module Authors
      class Update < TilWeb::Operation

        include Import[
          'repositories.authors',
          'uploads.uploader'
        ]

        def call(id, attributes)
          attr = Validations::Authors::Update.call(attributes)
          if attr.success?
            author = find_author(id)
            attacher = ImageUploader::Attacher.new(author, :avatar)
            if attributes['avatar']
              attacher.assign(attributes['avatar'][:tempfile])
              values = attr.output.merge(avatar_data: attacher.read)
              changeset = build_changeset(id, values)
              author = authors.update(id, changeset)

              attacher.context[:record] = author
            else
              author = authors.update(id, attr.output)
            end
            attacher.finalize if attacher.attached?
            Dry::Monads::Right(author)
          else
            Dry::Monads::Left(attr.errors)
          end
        end

        def find_author(id)
          authors[id]
        end

        def build_changeset(id, values)
          authors.changeset(id, values)
        end
      end
    end
  end
end
