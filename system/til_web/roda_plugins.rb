require 'roda'

class Roda
  module RodaPlugins
    module Logged
      module RequestMethods
        def logged
          resolve('operations.authentication.logged') do |logged|
            logged.call(scope.session) do |m|
              m.success do |user|
                current_user!(user)
              end

              m.failure {}

              yield
            end
          end
        end

        private

        def current_user!(user)
          scope.env['current_user'] = user
        end
      end
    end
  end
end
