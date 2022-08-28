class RemoveShareCodeFromEndUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :end_users, :share_code, :string
  end
end
