class CreateDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :details do |t|
      t.references :subject, foreign_key: true
      t.string :detail_name, null: false, default: ""
      t.integer :tax_rate, null: false, default: ""


      t.timestamps
    end
  end
end
