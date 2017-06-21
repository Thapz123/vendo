class Transaction < ApplicationRecord
  validates_presence_of :maker_id, :recipient_id, :memo, :amount, :visibility, :status
  validates_inclusion_of :visibility, in: %w(public friends private)
  validates_inclusion_of :status, in: %w(pending resolved rejected)
  validates_length_of :memo, minimum: 1, too_short: "You must supply a memo.", too_long: "Memos must be 200 characters or fewer."
  validates_numericality_of :amount, greater_than: 0.00
  validates_with TwoPartyValidator, :initiator => :maker_id, :receiver => :recipient_id

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

  has_many(
    :likes,
    class_name: "Like",
    primary_key: :id,
    foreign_key: :transaction_id,
    dependent: :destroy
  )

  has_many(
      :likers,
      through: :likes,
      source: :liking_user
  )

  has_many(
    :comments,
    class_name: "Comment",
    primary_key: :id,
    foreign_key: :transaction_id,
    dependent: :destroy
  )



  def currently_liked?

  end

end
