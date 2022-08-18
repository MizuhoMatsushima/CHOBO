class Public::EndUsersController < ApplicationController
  def top
    @account_books = AccountBook.all
    @end_user = current_end_user
  end

  def show
    @end_user = current_end_user
  end

  def edit
    @end_user = current_end_user
  end

  def update
    @end_user = current_end_user
    if @end_user.update(end_user_params)
      redirect_to my_page_end_users_path(@end_user)
    else
      render :edit
    end
  end

  def confirm
  end

  def search
  end

  private

  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :phone_number, :share_code)
  end
end
