class Comment < ApplicationRecord
  validates_presence_of :user_id, :transaction_id, :body
  validates_length_of :body, minimum: 1, too_short: "Comments cannot be empty.", too_long: "Comments must be 200 characters or fewer."

  belongs_to(
    :commenting_user,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id
  )

  belongs_to(
    :commented_transaction,
    class_name: "Transaction",
    primary_key: :id,
    foreign_key: :transaction_id
  )

end
