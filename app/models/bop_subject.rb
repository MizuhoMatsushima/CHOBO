class BopSubject < ApplicationRecord

  has_many :bop_details, dependent: :destroy
  belongs_to :account_book_params

end
