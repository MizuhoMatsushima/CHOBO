class CreateMiddleOfTags < ActiveRecord::Migration[6.1]
  def change
    create_table :middle_of_tags do |t|
      t.references :consultation, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
