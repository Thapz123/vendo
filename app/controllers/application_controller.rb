class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  # Applies to all actions unless otherwise directed
  before_action :authorize_request
  attr_reader :current_user

  private

  # Validate request with token and return user if successful
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user].as_json(:except => [:password_digest])
  end
end
