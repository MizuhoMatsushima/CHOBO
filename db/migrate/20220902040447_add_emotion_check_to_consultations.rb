class AddEmotionCheckToConsultations < ActiveRecord::Migration[6.1]
  def change
    add_column :consultations, :emotion_check, :integer, default: 0
  end
end
