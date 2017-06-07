class AuthorizeApiRequest
  def initialize(headers = {})
    @headers = headers
  end

  # Returns user object
  def call
    {
      user: user
    }
  end

  private

  attr_reader :headers

  def user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token

  rescue ActiveRecord::RecordNotFound => e

    raise(
      ExceptionHandler::InvalidToken,
      ("#{AuthMessage.invalid_token} #{e.message}")
    )
  end

  # Decode authentication token
  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  # Checks for token in 'Authorization' header
  def http_auth_header
    if headers['Authorization'].present?
      return header['Authorization'].split(' ').last
    end

    raise(ExceptionHandler::MissingToken, AuthMessage.missing_token)
  end
end
