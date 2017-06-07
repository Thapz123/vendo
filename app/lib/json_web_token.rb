# Creates class for JWT Singleton
class JsonWebToken
  # Secret to encode/decode jwt
  SECRET = Rails.application.secrets.secret_key_base

  def self.encode(payload, expires = 24.hours.from_now)
    # Set expiration to 24 hrs from creation
    payload[:expires] = expires.to_i

    # Sign jwt with app secret
    JWT.encode(payload, SECRET)
  end

  def self.decode(token)
    # Get payload
    body = JWT.decode(token, SECRET)[0]
    HashWithIndifferentAccess.new body

  rescue JWT::ExpiredSignature, JWT::VerificationError => e
    raise ExceptionHandler::ExpiredSignature, e.message
  end

end
