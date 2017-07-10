class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  # Signup route
  def create
    user = User.create!(user_params)
    auth_options = {email: user.email, username: user.username, password: user.password}
    auth_token = AuthenticateUser.new(auth_options).call
    response = { message: AuthMessage.account_created, auth_token: auth_token }
    json_response(response)
  end

  def show
    user = User.find_by(username: user_params[:username].downcase)
    result = {user: user.as_json}
    result[:user].store(:account_balance, @current_user.account.balance) if @current_user == user
    json_response(result)
  end

  def update
    update_user_with_params(@current_user, user_params)
  end

  def destroy
    @current_user.delete
    json_response({message: 'Your account has been deleted.'})
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :username, :email, :password)
  end
end
