class SourceOfIncome < ApplicationRecord

  belongs_to :end_user
  has_many :account_books

  validates :source_name, presence: true, length: { minimum: 1, maximum: 50, allow_blank: true }

end
