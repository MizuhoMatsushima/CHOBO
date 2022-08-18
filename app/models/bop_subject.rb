class BopSubject < ApplicationRecord

  has_many :bop_details, inverse_of: :bop_subject, dependent: :destroy
  accepts_nested_attributes_for :bop_details, allow_destroy: true
  belongs_to :account_book

  enum bop: { balance: 0, payments: 1 }

  # def income_serect
  #   self.pay_day + '(' + self.source_name + ')'
  # end

end
