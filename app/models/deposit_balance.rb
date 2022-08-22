class DepositBalance < ApplicationRecord

  belongs_to :end_user
  belongs_to :account_book
  belongs_to :savings_estination
end
