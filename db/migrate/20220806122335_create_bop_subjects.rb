class CreateBopSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :bop_subjects do |t|
      t.references :end_user, foreign_key: true
      t.string :subject_name
      t.integer :bop
      t.integer :total_price, null: false
      t.datetime :date, null: false
      t.integer :point
      t.string :memo
      t.string :store
      t.integer :registered_person_id
      t.string :share_code
      t.integer :share_end_user_id
      t.timestamps
    end
  end
end
