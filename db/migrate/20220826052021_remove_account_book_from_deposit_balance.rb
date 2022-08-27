class RemoveAccountBookFromDepositBalance < ActiveRecord::Migration[6.1]
  def change
    remove_reference :deposit_balances, :account_book, null: false, foreign_key: true
  end
end
