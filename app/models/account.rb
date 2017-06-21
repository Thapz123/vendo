class Account < ApplicationRecord
  validates_presence_of :owner_id, :balance
  validates_numericality_of :balance, greater_than_or_equal_to: 0.00

  belongs_to(
    :owner,
    class_name: "User",
    primary_key: :id,
    foreign_key: :owner_id
  )

  def add(amount)
    self.balance = self.balance + amount
  end

  def deduct(amount)
    self.balance = self.balance - amount if sufficient?(amount)
  end

  def sufficient?(amount_to_deduct)
    return false if self.balance - amount_to_deduct < 0.00
    true
  end
end
