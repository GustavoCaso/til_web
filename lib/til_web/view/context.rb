# auto_register: false
require 'til_web/decorators/author'

module TilWeb
  module View
    class Context

      class Authorized < Context
        def current_user
          TilWeb::Decorators::Author.new(self[:current_user])
        end

        def logged_in?
          true
        end
      end

      attr_reader :attrs

      def initialize(attrs = {})
        @attrs = attrs
      end

      def csrf_token
        self[:csrf_token]
      end

      def csrf_metatag
        self[:csrf_metatag]
      end

      def csrf_tag
        self[:csrf_tag]
      end

      def flash
        self[:flash]
      end

      def flash?
        %i[notice alert].any? { |type| flash[type] }
      end

      def with(new_attrs)
        self.class.new(attrs.merge(new_attrs))
      end

      def logged_in?
        false
      end

      def authorized(current_user)
        Authorized.new(attrs.merge(current_user: current_user))
      end

      private

      def [](name)
        attrs.fetch(name)
      end
    end
  end
end
