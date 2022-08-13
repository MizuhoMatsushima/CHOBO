class CreateBopDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :bop_details do |t|
      t.references :bop_subject, foreign_key: true
      t.string :detail_name, null: false, default: ""
      t.datetime :use_at, null: false, default: ""
      t.integer :detail_price, null: false, default: ""
      t.integer :amount, null: false, default: ""
      t.string :store, null: false, default: ""
      t.integer :registered_person_id, default: ""

      t.timestamps
    end
  end
end
