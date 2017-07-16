module Persistence
  module Commands
    class CreateTil < ROM::Commands::Create[:sql]
      relation :tils
      register_as :create
      result :one
    end
  end
end
