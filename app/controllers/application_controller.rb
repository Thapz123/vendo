class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  include UpdateHelper

  # Applies to all actions unless otherwise directed
  before_action :authorize_request
  attr_reader :current_user

  private

  # Validate request with token and return user if successful
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
