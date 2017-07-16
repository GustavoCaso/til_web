module Test
  module DatabaseHelpers
    module_function

    def rom
      TilWeb::Container["persistence.rom"]
    end

    def db
      TilWeb::Container["persistence.db"]
    end
  end
end
