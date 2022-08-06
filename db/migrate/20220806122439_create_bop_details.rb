class CreateBopDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :bop_details do |t|
      t.integer :bop_subject, foreign_key: true
      t.string :name, null: false, default: ""
      t.datetime :use_at, null: false, default: ""
      t.integer :price, null: false, default: ""
      t.integer :amount, null: false, default: ""
      t.string :store, null: false, default: ""
      t.integer :registered_person_id, null: false, default: ""

      t.timestamps
    end
  end
end
