class Admin::EndUsersController < ApplicationController
  def show
    @end_user = EndUser.find(params[:id])
  end

  def search
    @end_users = EndUser.all
    @end_user = EndUser.search(params[:keyword]).order('created_at DESC')
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      redirect_to admin_end_user_path(@end_user)
    else
      render :edit
    end
  end


  private

  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :phone_number, :share_code, :is_deleted)
  end
end
