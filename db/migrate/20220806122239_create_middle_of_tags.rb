class CreateMiddleOfTags < ActiveRecord::Migration[6.1]
  def change
    create_table :middle_of_tags do |t|
      t.integer :consultation, foreign_key: true
      t.integer :tag, foreign_key: true

      t.timestamps
    end
  end
end
