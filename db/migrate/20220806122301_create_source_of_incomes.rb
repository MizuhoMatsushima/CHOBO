class CreateSourceOfIncomes < ActiveRecord::Migration[6.1]
  def change
    create_table :source_of_incomes do |t|
      t.references :end_user, foreign_key: true
      t.string :source_name, null: false

      t.timestamps
    end
  end
end
