require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class CustomStrategy < Authenticatable
      def valid?
        true
      end

      def authenticate!
        if params[:user]

          user = User.find_by_username(params[:user][:username])

          if user && user.encrypted_password == Digest::MD5::hexdigest(params[:user][:password])
            success!(user)
          else
            fail
          end

        else
          fail
        end
      end

    end
  end
end

Warden::Strategies.add(:custom_strategy, Devise::Strategies::CustomStrategy)