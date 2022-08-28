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


  validates :first_name, presence: true, length: { minimum: 1, maximum: 50, allow_blank: true }
  validates :last_name, presence: true, length: { minimum: 1, maximum: 50, allow_blank: true }
  validates :first_name_kana, presence: true, length: { minimum: 1, maximum: 50, allow_blank: true },
            format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, allow_blank: true}
  validates :last_name_kana, presence: true, length: { minimum: 1, maximum: 50, allow_blank: true },
            format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, allow_blank: true}
  validates :email, presence: true
  VALID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/
  validates :phone_number, presence: true, format: { with: VALID_PHONE_NUMBER_REGEX, allow_blank: true }
  validates :password, presence: true, length: { minimum: 6 }, on: :create, unless: -> { :guest_sign_in }
  validates :password_confirmation, presence: true, length: { minimum: 6 }, on: :create, unless: -> { :guest_sign_in }

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

  def income_total(dt)
    # array = [] #空の配列を用意し、
    # AccountBook.where(pay_day: dt.beginning_of_month...dt.end_of_month).each do |account_book|
    #   array << account_book.income
    #   #テーブルのレコードを１件ずつ取り出し、incomeカラムのデータを配列に入れる
    # end
    # array.sum
    self.account_books.where(pay_day: dt.beginning_of_month...dt.end_of_month).map{|k| k.income}.sum
  end

  def balance(dt)
    array = [] #空の配列を用意し
    BopSubject.pluck(:subject_name).uniq.each do |name|

      group = BopSubject.where(subject_name: name, date: dt.beginning_of_month...dt.end_of_month)

      if group.where(bop: 0).count > 0

        array << group.where(bop: 0).sum{|k| k.total_price}
      else
        array << group.where(bop: 1).sum{|k| k.total_price}
      end
    end
    array.sum
  end

  def payments(dt)
    # array = [] #空の配列を用意し、
    # BopSubject.where(date: dt.beginning_of_month...dt.end_of_month, bop: 1).each do |bop_subject|
    #   array << bop_subject.total_price
    #   #テーブルのレコードを１件ずつ取り出し、total_priceカラムのデータを配列に入れる
    # end
    # array.sum
    self.bop_subjects.where(date: dt.beginning_of_month...dt.end_of_month, bop: 1).map{|k| k.total_price}.sum
  end

  def balance_bop(dt)
    income_total(dt).to_i - balance(dt).to_i
  end

  def payments_bop(dt)
    income_total(dt).to_i - payments(dt).to_i
  end

  #groupにしたカラムのgroupごとの小計
  def subject_payments(subject_name, dt)
    # array = [] #空の配列を用意し、
    # BopSubject.where(subject_name: subject_name, date: dt.beginning_of_month...dt.end_of_month, bop: 0).each do |bop_subject|
    #   array << bop_subject.total_price
    # end
    # array.sum
    self.bop_subjects.where(subject_name: subject_name, date: dt.beginning_of_month...dt.end_of_month, bop: 1).map{|k| k.total_price}.sum
  end

  def subject_balance(subject_name, dt)
    # array = [] #空の配列を用意し、
    # BopSubject.where(subject_name: subject_name, date: dt.beginning_of_month...dt.end_of_month, bop: 0).each do |bop_subject|
    #   array << bop_subject.total_price
    # end
    # array.sum
    self.bop_subjects.where(subject_name: subject_name, date: dt.beginning_of_month...dt.end_of_month, bop: 0).map{|k| k.total_price}.sum
  end

  def subject_bop(bop_subject, dt)
    subject_balance(bop_subject, dt).to_i - subject_payments(bop_subject, dt).to_i
  end

  def balance_index(dt)
    BopSubject.where(date: dt.beginning_of_month...dt.end_of_month, bop: 0)
  end

  def self.grapf(dt)
    payments = BopSubject.where(bop: 1).group(:subject_name).sum(:total_price)
    balance = BopSubject.where(bop: 0).group(:subject_name).sum(:total_price)

    balance.each do |balance|
      payments["balance"] = balance
    end
  end

  def savings_amount(dt)
    self.deposit_balances.where(deposit_date: dt.beginning_of_month...dt.end_of_month).map{|k| k.savings_amount}.sum
  end

end
