require 'bcrypt'

module TilWeb
  module Authentication
    class PasswordDigest
      include BCrypt

      def create(password)
        Password.create(password)
      end
    end
  end
end
