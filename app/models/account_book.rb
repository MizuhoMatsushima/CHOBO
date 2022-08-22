class AccountBook < ApplicationRecord

  belongs_to :end_user
  has_many :deposit_balances, dependent: :destroy
  belongs_to :source_of_income

  validates :source_of_income_id, presence: true
  validates :income, presence: true
  validates :pay_day, presence: true

  def income_total
    array = [] #空の配列を用意し、
    AccountBook.all.each do |account_book|
      array << account_book.income
      #bookテーブルのレコードを１件ずつ取り出し、priceカラムのデータを配列に入れる
    end
    array.sum
  end
end
