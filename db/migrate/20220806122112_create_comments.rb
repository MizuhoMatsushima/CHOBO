class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :end_user, foreign_key: true
      t.integer :consultation, foreign_key: true
      t.text :body, null: false, default: ""

      t.timestamps
    end
  end
end
