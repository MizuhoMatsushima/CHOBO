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

end
