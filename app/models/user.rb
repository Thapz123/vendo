class User < ApplicationRecord
  has_secure_password

  validates_presence_of :name, :email, :password_digest
  validates_uniqueness_of :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  validates_length_of :password, in: 6 .. 128, allow_nil: false, allow_blank: false

  # has_many :transactions
  # has_many :friendships
  # likes
  # comments
end
