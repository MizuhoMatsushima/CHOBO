class CreateDepositBalances < ActiveRecord::Migration[6.1]
  def change
    create_table :deposit_balances do |t|
      t.integer :end_user_id, foreign_key: true
      t.integer :account_book_id, foreign_key: true
      t.integer :savings_estination_id, foreign_key: true
      t.integer :savings_amount, null: false, default: 0

      t.timestamps
    end
    add_foreign_key :deposit_balances, :end_users
    add_foreign_key :deposit_balances, :account_books
    add_foreign_key :deposit_balances, :savings_estinations
  end
end
