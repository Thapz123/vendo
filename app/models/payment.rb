class Payment < ApplicationRecord
  validates_presence_of :maker_id, :recipient_id, :memo, :amount
  validates_inclusion_of :visibility, in: %w(public friends private)
  validates_numericality_of :charge, greater_than: 0.00

  
end
