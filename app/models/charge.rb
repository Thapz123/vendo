class Charge < ApplicationRecord
  validates_presence_of :maker_id, :recipient_id, :memo, :amount
  validates_inclusion_of :visibility, in: %w(public friends private)
  validates_inclusion_of :status, in: %w(pending resolved rejected)
  validates_numericality_of :amount, greater_than: 0.00

  belongs_to(
    :maker,
    class_name: "User",
    primary_key: :id,
    foreign_key: :maker_id
  )

  belongs_to(
    :recipient,
    class_name: "User",
    primary_key: :id,
    foreign_key: :recipient_id
  )

end
