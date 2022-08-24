class BopSubject < ApplicationRecord

  has_many :bop_details, inverse_of: :bop_subject, dependent: :destroy
  accepts_nested_attributes_for :bop_details, allow_destroy: true

  enum bop: { balance: 0, payments: 1 }

  NUMBERS_REGEX = /\A[0-9]+\z/
  validates :total_price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, allow_blank: true}, format: { with: NUMBERS_REGEX, allow_blank: true }
  validates :date, presence: true

  with_options if: :bop_payments? do
    validates :subject_name, presence: true
    validates :store, presence: true
  end

  def bop_payments?
   bop == 'payments'
  end


  def income_select
    self.pay_day.strftime('%Y年%m月%d日') + '(' + self.source_name + ')'
  end

  def pay_day_select
    self.pay_day.strftime('%Y年%m月%d日') + "の収入"
  end

end
