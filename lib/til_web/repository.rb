# auto_register: false

require "rom-repository"
require "til_web/container"
require "til_web/import"

TilWeb::Container.boot! :rom

module TilWeb
  class Repository < ROM::Repository::Root
    include TilWeb::Import.args["persistence.rom"]
  end
end
