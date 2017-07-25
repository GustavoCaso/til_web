require "dry-validation"

module TilWeb
  module Validations
    Tils = Dry::Validation.Form do
      required(:title).filled(:str?)

      required(:text).filled(:str?)
    end
  end
end
