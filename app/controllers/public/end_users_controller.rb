class Public::EndUsersController < ApplicationController
  def top
    @current_date = DateTime.current.beginning_of_month
    if params[:date].nil?
      month = @current_date
    elsif DateTime.parse("#{params[:date]}-1").strftime("%Y-%m") == @current_date.prev_month.strftime("%Y-%m")
      month = @current_date.prev_month
    else
      month = DateTime.parse("#{params[:date]}-1")
    end
    @month = month
    next_month = month.next_month
    @end_user = current_end_user
    @bop_subjects = BopSubject.where(use_at: month...next_month)
    @end_user_bop = @end_user.bop_subjects.where(use_at: month...next_month)
    @bop_subject_price = @end_user_bop.group(:subject_name).sum(:total_price)
    @bop_subject_graph = @bop_subject_price.sort_by { |_, v| v }.reverse.to_h
    @bop_subject_name = @end_user_bop.group(:subject_name).pluck(:subject_name)
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
