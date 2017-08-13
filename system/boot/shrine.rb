TilWeb::Container.namespace "uploads" do |container|
  container.finalize :shrine do
    init do
      require "shrine"
      require 'shrine/storage/file_system'
      require 'til_web/shrine_plugins'

      use :rom

      storages = if ENV['RACK_ENV'] == 'test'
                   require 'shrine/storage/memory'
                   {
                     cache: Shrine::Storage::Memory.new,
                     store: Shrine::Storage::Memory.new,
                   }
                 else
                   {
                     cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
                     store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store"),
                   }
                 end

      Shrine.storages = storages

      Shrine.plugin :rack_file
      Shrine.plugin :logging
      Shrine.plugin :determine_mime_type
      Shrine.plugin :validation_helpers
      Shrine.plugin :backgrounding

      Shrine.plugin Shrine::Plugins::Rom,
        repository: ->(model) { container["repositories.#{model}"] }

      Shrine::Attacher.promote { |data| self.class.promote(data) }
      Shrine::Attacher.delete { |data| self.class.delete(data) }
    end

    start do
      require "image_processing/mini_magick"
      class ImageUploader < Shrine
        include ImageProcessing::MiniMagick
        plugin :processing
        plugin :versions

        process(:store) do |io, _|
          original = io.download

          small = resize_to_limit!(original, 50, 50) { |cmd| cmd.auto_orient }

          { original: io, small: small }
        end
      end
      container.register "uploader", ImageUploader
    end
  end
end
