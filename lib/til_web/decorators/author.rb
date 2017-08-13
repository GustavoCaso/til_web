# auto_register: false
require 'til_web/container'

TilWeb::Container.boot! :shrine

module TilWeb
  module Decorators
    class Author < SimpleDelegator
      def avatar_url
        if avatar_data && !avatar_data.empty?
          uploader.uploaded_file(avatar_data)[:small].url
        else
          '/images/default_avatar.png'
        end
      end

      private

      def uploader
        TilWeb::Container['uploads.uploader']
      end
    end
  end
end
