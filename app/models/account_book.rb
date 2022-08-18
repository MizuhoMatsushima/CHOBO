class AccountBook < ApplicationRecord
  has_many :bop_subjects, dependent: :destroy


  def income_total
    array = [] #空の配列を用意し、
    AccountBook.all.each do |account_book|
      array << account_book.income
      #bookテーブルのレコードを１件ずつ取り出し、priceカラムのデータを配列に入れる
    end
    array.sum
  end
end
