class User < ApplicationRecord
  has_secure_password

  validates_presence_of :first_name, :last_name, :email, :password_digest
  validates_uniqueness_of :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  validates_length_of :password, in: 6 .. 128, allow_nil: false, allow_blank: false

  after_initialize :set_username

  has_many(
    :payments_made,
    class_name: "Payment",
    primary_key: :id,
    foreign_key: :maker_id
  )

  has_many(
    :payments_received,
    class_name: "Payment",
    primary_key: :id,
    foreign_key: :recipient_id
  )

  has_many(
    :charges_made,
    class_name: "Charge",
    primary_key: :id,
    foreign_key: :maker_id
  )

  has_many(
    :charges_received,
    class_name: "Charge",
    primary_key: :id,
    foreign_key: :recipient_id
  )

  has_many :friendships

  has_many(
    :friends,
    through: :friendships,
    source: :friend
  )

  has_many :likes

  has_many :comments

  private

  def set_username
    self.username ||= "#{self.first_name}-#{self.last_name}-#{rand(1..99)}" if self.new_record?
  end
  
end
