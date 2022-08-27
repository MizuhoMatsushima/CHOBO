class AccountBook < ApplicationRecord

  belongs_to :end_user
  has_many :deposit_balances, dependent: :destroy
  belongs_to :source_of_income

  validates :source_of_income_id, presence: true
  INCOME_REGEX = /\A[0-9]+\z/
  validates :income, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}, format: { with: INCOME_REGEX }
  validates :pay_day, presence: true
  validates :book_date, presence: true

  def income_total
    array = [] #空の配列を用意し、
    AccountBook.all.each do |account_book|
      array << account_book.income
      #bookテーブルのレコードを１件ずつ取り出し、priceカラムのデータを配列に入れる
    end
    array.sum
  end
end
