require "dry-validation"

module TilWeb
  module Validations
    module Authors
      EMAIL_REGEX_VALIDATION = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

      Create = Dry::Validation.Form do
        required(:name).filled(:str?)

        required(:email).filled(:str?, format?: EMAIL_REGEX_VALIDATION)

        required(:password).filled(:str?, min_size?: 8)
      end
    end
  end
end
