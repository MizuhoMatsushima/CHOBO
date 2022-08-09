class Consultation < ApplicationRecord
  belongs_to :end_user
  has_many :middle_of_tags, dependent: :destroy
  has_many :tags, through: :middle_of_tags
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete　Tag.find_by(name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
    end
  end

  #consultationのviewで使用
  def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)
  end

  #キーワード検索
  def self.search(search)
    if search != nil
      Consultation.where('title LIKE(?) or body LIKE(?)' , "%#{search}%",  "%#{search}%")
    else
      Consultation.all
    end
  end

end
