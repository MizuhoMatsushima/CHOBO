class CreateDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :details do |t|
      t.references :subject, foreign_key: true
      t.string :detail_name, null: false
      t.integer :tax_rate, null: false


      t.timestamps
    end
  end
end
