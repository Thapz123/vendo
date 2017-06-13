class Comment < ApplicationRecord

  belongs_to(
    :maker,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id
  )

  # belongs_to(
  #
  # )

end
