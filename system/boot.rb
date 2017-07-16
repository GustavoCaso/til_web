begin
  require "pry-byebug"
rescue LoadError
end

require_relative "til_web/container"

TilWeb::Container.finalize!

require "til_web/application"
