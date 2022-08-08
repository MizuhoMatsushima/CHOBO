class Tag < ApplicationRecord
  has_many :middle_of_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :consultations, through: :middle_of_tags
end
