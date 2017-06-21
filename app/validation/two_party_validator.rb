class TwoPartyValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:base] << "This action requires two separate User objects." if same_user
  end

  private

  def same_user
    options[:initiator] == options[:receiver]
  end
end
