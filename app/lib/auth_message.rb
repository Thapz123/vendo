class AuthMessage
  def self.not_found(record = 'record')
    "#{record} not found."
  end

  def self.invalid_credentials
    'Invalid credentials.'
  end

  def self.invalid_token
    'Invalid token.'
  end

  def self.missing_token
    'Missing token.'
  end

  def self.unauthorized
    'Unauthorized request.'
  end

  def self.account_created
    'Account creation was successful.'
  end

  def self.account_not_created
    'Account could not be created.'
  end

  def self.expired_token
    'Expired token. Login again to continue.'
  end
end
