class SavingsEstination < ApplicationRecord

  belongs_to :end_user

  validates :savings_estination_name, presence: true

end
