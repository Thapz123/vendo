class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  # Signup route
  def create
    user = User.create!(user_params)
    auth_options = {email: user.email, username: user.username, password: user.password}
    auth_token = AuthenticateUser.new(auth_options).call
    response = { message: AuthMessage.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  def index

  end

  def show

  end

  def update

  end

  def destroy

  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
