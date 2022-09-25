class Consultation < ApplicationRecord
  belongs_to :end_user
  has_many :middle_of_tags, dependent: :destroy
  has_many :tags, through: :middle_of_tags
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true


  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      old_tag_id = Tag.find_by(name: old).id
      self.middle_of_tags.find_by(tag_id: old_tag_id).destroy
#      self.tags.delete　Tag.find_by(name: old)
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
    end
  end

  def self.ai_search(score, check)
    if score == "plus"
      if check == ""
        Consultation.where("score >= ?", 0)
      else
        Consultation.where("score >= ?", 0).where(emotion_check: check)
      end
    elsif score == "minus"
      if check == ""
        Consultation.where("score < ?", 0)
      else
        Consultation.where("score < ?", 0).where(emotion_check: check)
      end
    else
      if check == ""
        Consultation.all
      else
        Consultation.where(emotion_check: check)
      end
    end
  end


  #氏名の姓名を合わせるメソッド
  def full_name
    end_user.last_name + ' ' + end_user.first_name
  end

end
