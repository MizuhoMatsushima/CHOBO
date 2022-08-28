class RemoveShareCodeFromBopSubjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :bop_subjects, :share_code, :string
  end
end
