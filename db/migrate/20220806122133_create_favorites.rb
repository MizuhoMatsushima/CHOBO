class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :end_user, foreign_key: true
      t.references :consultation, foreign_key: true

      t.timestamps
    end
  end
end
