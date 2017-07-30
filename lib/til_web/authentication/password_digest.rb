require 'bcrypt'

module TilWeb
  module Authentication
    class PasswordDigest
      include BCrypt

      def create(password)
        Password.create(password)
      end

      def valid?(password_digest, password)
        Password.new(password_digest) == password
      end
    end
  end
end
