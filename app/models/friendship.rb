class Friendship < ApplicationRecord
  validates_presence_of :requester_id, :responder_id
  validates_uniqueness_of :responder_id, scope: [:requester_id]

  belongs_to(
    :requester,
    class_name: "User",
    primary_key: :id,
    foreign_key: :requester_id
  )

  belongs_to(
    :responder,
    class_name: "User",
    primary_key: :id,
    foreign_key: :responder_id
  )

end
