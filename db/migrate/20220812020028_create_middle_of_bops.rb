class CreateMiddleOfBops < ActiveRecord::Migration[6.1]
  def change
    create_table :middle_of_bops do |t|

      t.timestamps
    end
  end
end
