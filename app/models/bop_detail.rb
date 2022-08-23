class BopDetail < ApplicationRecord

  belongs_to :bop_subject

  validates :detail_price, presence: true
  NUMBERS_REGEX = /\A[0-9]+\z/
  validates :detail_price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}, format: { with: NUMBERS_REGEX }
  validates :amount, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}, format: { with: NUMBERS_REGEX }
end
