class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

  def authenticate
    auth_token = AuthenticateUser.new(auth_params).call
    json_response(auth_token: auth_token)
  end

  def signout
    
  end

  private

  def auth_params
    params.permit(:email, :username, :password)
  end
end
