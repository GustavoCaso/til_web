module Persistence
  module Commands
    class CreateAuthor < ROM::Commands::Create[:sql]
      relation :authors
      register_as :create
      result :one
    end
  end
end
