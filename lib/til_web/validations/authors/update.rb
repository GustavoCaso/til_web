require "dry-validation"

module TilWeb
  module Validations
    module Authors
      EMAIL_REGEX_VALIDATION = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

      Update = Dry::Validation.Form do
        required(:name).filled(:str?)

        required(:email).filled(:str?, format?: EMAIL_REGEX_VALIDATION)

        optional(:avatar).filled(:hash?)
      end
    end
  end
end
