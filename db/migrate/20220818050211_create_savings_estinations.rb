class CreateSavingsEstinations < ActiveRecord::Migration[6.1]
  def change
    create_table :savings_estinations do |t|
      t.references :end_user, foreign_key: true
      t.string :savings_estination_name, null: false, default: ""

      t.timestamps
    end
  end
end
