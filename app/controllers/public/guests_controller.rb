class Public::GuestsController < ActionController::Base

  def guest_sign_in
    end_user = EndUser.find_or_create_by!(email: 'guest@com') do |end_user|
     end_user.password = SecureRandom.urlsafe_base64
     # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
   end
    sign_in end_user
    redirect_to end_users_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end