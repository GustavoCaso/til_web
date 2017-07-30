require "dry-validation"

module TilWeb
  module Validations
    EMAIL_REGEX_VALIDATION = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    Authors = Dry::Validation.Form do
      required(:name).filled(:str?)

      required(:email).filled(:str?, format?: EMAIL_REGEX_VALIDATION)

      required(:password).filled(:str?)
    end
  end
end
