class Public::GuestsController < ActionController::Base

  def guest_sign_in
    end_user = EndUser.find_or_create_by!(email: 'guest@com') do |end_user|
      end_user.password = SecureRandom.urlsafe_base64
      end_user.last_name = "Guest"
      end_user.first_name = "User"
      end_user.last_name_kana = "ゲスト"
      end_user.first_name_kana = "ユーザー"
      end_user.phone_number = "0312345678"
   end
    sign_in end_user
    redirect_to end_users_path, notice: 'ゲストユーザーとしてログインしました'
  end

end