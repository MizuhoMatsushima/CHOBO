class Tag < ApplicationRecord
  has_many :middle_of_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :consultations, through: :middle_of_tags

  #タグ検索
  def self.search(search)
    if search != '#'
      tag = Tag.where(name: search)
      tag[0].consultations
    else
      Consultation.all
    end
  end

end
