class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :consultations, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :account_books, dependent: :destroy
  has_many :bop_subjects, dependent: :destroy
  has_many :bop_details, dependent: :destroy
  has_many :savings_estinations, dependent: :destroy
  has_many :source_of_incomes, dependent: :destroy
  has_many :deposit_balances, dependent: :destroy

  #氏名の姓名を合わせるメソッド
  def full_name
    self.last_name + ' ' + self.first_name
  end

  def full_name_kana
    self.last_name_kana + ' ' + self.first_name_kana
  end

  def self.search(search)
    if search != nil
      EndUser.where('last_name LIKE(?) or first_name LIKE(?)' , "%#{search}%",  "%#{search}%")
    else
      EndUser.all
    end
  end

  def income_total
    array = [] #空の配列を用意し、
    AccountBook.all.each do |account_book|
      array << account_book.income
      #テーブルのレコードを１件ずつ取り出し、incomeカラムのデータを配列に入れる
    end
    array.sum
  end

  def bop_subject_total
    array = [] #空の配列を用意し、
    BopSubject.all.each do |bop_subject|
      array << bop_subject.total_price
      #テーブルのレコードを１件ずつ取り出し、total_priceカラムのデータを配列に入れる
    end
    array.sum
  end

  def bop
    income_total.to_i - bop_subject_total.to_i
  end

end
