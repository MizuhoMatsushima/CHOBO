class Comment < ApplicationRecord
  belongs_to :end_user
  belongs_to :consultation

  validates :body, presence: true, length: {maximum: 400}

  #氏名の姓名を合わせるメソッド
  def full_name
    end_user.last_name + end_user.first_name
  end
end
