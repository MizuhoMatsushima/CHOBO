class AddDepositDetaToDepositBalance < ActiveRecord::Migration[6.1]
  def change
    add_column :deposit_balances, :deposit_date, :datetime
  end
end
