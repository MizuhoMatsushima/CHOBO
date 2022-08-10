class CreateBopSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :bop_subjects do |t|
      t.references :end_user, foreign_key: true
      t.references :account_book, foreign_key: true
      t.string :subject_name, null: false, default: ""
      t.integer :price, null: false, default: ""
      t.integer :point, default: ""
      t.string :memo, default: ""
      t.integer :registered_person_id, null: false, default: ""

      t.timestamps
    end
  end
end
