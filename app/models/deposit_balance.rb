class DepositBalance < ApplicationRecord

  belongs_to :end_user
  belongs_to :savings_estination

  validates :savings_estination_id, presence: true
  NUMBERS_REGEX = /\A[0-9]+\z/
  validates :savings_amount, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, allow_blank: true}, format: { with: NUMBERS_REGEX, allow_blank: true }
  validates :deposit_date, presence: true

  scope :current_date_month, -> { where("deposit_date <= ?",Time.zone.now.end_of_day) } # 今月
  scope :date_1month_ago, -> { where("deposit_date <= ?", 1.month.ago.end_of_day) } # 前月
  scope :date_2month_ago, -> { where("deposit_date <= ?", 2.month.ago.end_of_day) } # 2ヶ月前
  scope :date_3month_ago, -> { where("deposit_date <= ?", 3.month.ago.end_of_day) } # 3ヶ月前
  scope :date_4month_ago, -> { where("deposit_date <= ?", 4.month.ago.end_of_day) } # 4ヶ月前
  scope :date_5month_ago, -> { where("deposit_date <= ?", 5.month.ago.end_of_day) } # 5ヶ月前
  scope :date_6month_ago, -> { where("deposit_date <= ?", 6.month.ago.end_of_day) } # 6ヶ月前
  scope :date_7month_ago, -> { where("deposit_date <= ?", 7.month.ago.end_of_day) } # 7ヶ月前
  scope :date_8month_ago, -> { where("deposit_date <= ?", 8.month.ago.end_of_day) } # 8ヶ月前
  scope :date_9month_ago, -> { where("deposit_date <= ?", 9.month.ago.end_of_day) } # 9ヶ月前
  scope :date_10month_ago, -> { where("deposit_date <= ?", 10.month.ago.end_of_day) } # 10ヶ月前
  scope :date_11month_ago, -> { where("deposit_date <= ?", 11.month.ago.end_of_day) } # 11ヶ月前
  scope :date_12month_ago, -> { where("deposit_date <= ?", 12.month.ago.end_of_day) } # 12ヶ月前

  def month
    #DepositBalance.
  end

end
