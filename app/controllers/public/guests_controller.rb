class Public::GuestsController < ActionController::Base

  def guest_sign_in
    end_user = EndUser.guest
    sign_in end_user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end