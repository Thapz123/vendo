# Authenticates User with e-mail and password
class AuthenticateUser
  def initialize(opts = {email: nil, username: nil, password: nil})
    @email = opts.fetch(:email)
    @username = opts.fetch(:username)
    @password = opts.fetch(:password)
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_reader :email, :username, :password

  def user
    user = email ? User.find_by(email: email) : User.find_by(username: username)
    return user if user && user.authenticate(password)
    raise(ExceptionHandler::AuthenticationError, AuthMessage.invalid_credentials)
  end
end
