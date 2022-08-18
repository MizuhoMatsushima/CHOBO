class CreateAccountBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :account_books do |t|
      t.references :end_user, foreign_key: true
      t.references :source_of_income, foreign_key: true
      t.integer :income, default: 0
      t.datetime :pay_day, null: false
      t.timestamps
    end
  end
end
