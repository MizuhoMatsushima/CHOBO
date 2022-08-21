class CreateConsultations < ActiveRecord::Migration[6.1]
  def change
    create_table :consultations do |t|
      t.references :end_user, foreign_key: true
      t.string :title, null: false, default: ""
      t.text :body, null: false
      t.boolean :is_draft, null: false, default: false

      t.timestamps
    end
  end
end
