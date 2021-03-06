module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end

  included do
    # Defines custom handlers
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :unprocessable_entity
    rescue_from ExceptionHandler::InvalidToken, with: :unprocessable_entity

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({error: e.message}, :not_found)
    end
  end

  private

  # 422
  def unprocessable_entity(e)
    json_response({error: e.message}, :unprocessable_entity)
  end

  # 401
  def unauthorized_request(e)
    json_response({error: e.message}, :unauthorized)
  end
end
