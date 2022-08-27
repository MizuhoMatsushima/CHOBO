class DepositBalance < ApplicationRecord

  belongs_to :end_user
  belongs_to :savings_estination

  validates :savings_estination_id, presence: true
  NUMBERS_REGEX = /\A[0-9]+\z/
  validates :savings_amount, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, allow_blank: true}, format: { with: NUMBERS_REGEX, allow_blank: true }
  validates :deposit_date, presence: true

  def month
    #DepositBalance.
  end

end
