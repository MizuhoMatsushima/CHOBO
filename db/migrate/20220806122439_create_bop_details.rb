class CreateBopDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :bop_details do |t|
      t.references :bop_subject, foreign_key: true
      t.string :detail_name, null: false
      t.integer :detail_price, null: false
      t.integer :amount, null: false
      t.string :store, null: false
      t.integer :registered_person_id

      t.timestamps
    end
  end
end
