class Comment < ApplicationRecord
  belongs_to :end_user
  belongs_to :consultation

  #氏名の姓名を合わせるメソッド
  def full_name
    end_user.last_name + end_user.first_name
  end
end
