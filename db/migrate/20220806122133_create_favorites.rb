class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :end_user, foreign_key: true
      t.integer :consultation, foreign_key: true

      t.timestamps
    end
  end
end
