class Like < ApplicationRecord
  validates_presence_of :user_id, :transaction_id

  belongs_to(
    :liking_user,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id
  )

  belongs_to(
    :liked_transaction,
    class_name: "Transaction",
    primary_key: :id,
    foreign_key: :transaction_id
  )

end
