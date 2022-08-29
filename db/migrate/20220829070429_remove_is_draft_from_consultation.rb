class RemoveIsDraftFromConsultation < ActiveRecord::Migration[6.1]
  def change
    remove_column :consultations, :is_draft, :boolean
  end
end
