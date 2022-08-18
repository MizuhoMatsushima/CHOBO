class AccountBook < ApplicationRecord
  has_many :bop_subjects, dependent: :destroy
end
