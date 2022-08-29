class Tag < ApplicationRecord
  has_many :middle_of_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :consultations, through: :middle_of_tags

#  validates :name, presence: true
#  validate :required_started_sharp
  def self.valid_tags(tags)

Rails.logger.debug(tags)
    if tags.length == 0
      Rails.logger.debug("1")
      return false
    else
      Rails.logger.debug("2")
      tags.each do |tag|
        Rails.logger.debug(tag)
        if tag.blank? || ! tag.start_with?("#")
          Rails.logger.debug("666")
          return false
        end
      end
    end
    Rails.logger.debug("5")
    true
  end

  #タグ検索
  def self.search(search)
    if search.include?('#')
      tag = Tag.where(name: search)
      puts tag.inspect
      unless tag.empty?
        tag[0].consultations
      else
        Consultation.all
      end
    else
      Consultation.all
    end
  end

end
