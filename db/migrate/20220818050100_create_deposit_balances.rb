class CreateDepositBalances < ActiveRecord::Migration[6.1]
  def change
    create_table :deposit_balances do |t|
      t.references :end_user, foreign_key: true
      t.references :account_book, foreign_key: true
      t.references :savings_estination, foreign_key: true
      t.integer :savings_amount, null: false, default: 0

      t.timestamps
    end
  end
end
