class Tag < ApplicationRecord
  has_many :middle_of_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :consultations, through: :middle_of_tags


  def self.valid_tags(tags)
    if tags.length == 0
      return false
    else
      tags.each do |tag|
        if tag.blank? || ! tag.start_with?("#")
          return false
        end
      end
    end
    true
  end

  #タグ検索
  def self.search(search)
    tag = Tag.where('name LIKE(?)', "%#{search}%")
    unless tag.empty?
      tag[0].consultations
    else
      nil
    end
  end

end
