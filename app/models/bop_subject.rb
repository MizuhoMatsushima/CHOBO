class BopSubject < ApplicationRecord

  has_many :bop_details, dependent: :destroy
  accepts_nested_attributes_for :bop_details, allow_destroy: true
  belongs_to :account_book

  enum bop: { balance: 0, payments: 1 }

end
