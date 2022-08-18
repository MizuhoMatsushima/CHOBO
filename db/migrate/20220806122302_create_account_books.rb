class CreateAccountBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :account_books do |t|
      t.references :end_user, foreign_key: true
      t.string :name, null: false, default: ""
      t.integer :price, default: ""
      t.string :share_code, default: ""
      t.integer :share_end_user_id, default: ""

      t.timestamps
    end
  end
end
