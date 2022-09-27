class Public::EndUsersController < ApplicationController
  before_action :guest, except: [:top, :show, :edit]

  def top
    @current_time = DateTime.current
    # 三項演算子Version
    @dt = params[:date].nil? ? DateTime.current : DateTime.parse("#{params[:date]}-01").in_time_zone('Asia/Tokyo')
    beginning_of_month = @dt.beginning_of_month # 月初
    end_of_month = @dt.end_of_month # 月末
    @end_user = current_end_user
    balance = @end_user.bop_subjects.where(bop: 0)
    @end_user_balance = balance.where(date: beginning_of_month...end_of_month)
    payments = @end_user.bop_subjects.where(bop: 1)
    @end_user_pay = payments.where(date: beginning_of_month...end_of_month).order(date: "DESC")
    @bop_subject_name = @end_user_pay.group(:subject_name).pluck(:subject_name)
    bop_subject_price = @end_user_pay.group(:subject_name).sum(:total_price)
    @bop_subject_graph = bop_subject_price.sort_by { |_, v| v }.reverse.to_h
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
      flash[:notice] = "登録情報を更新しました"
      redirect_to my_page_end_users_path(@end_user)
    else
      render :edit
    end
  end

  def confirm

  end

  def withdraw
    # is_deleteカラムに削除フラグを立てる(defaultはfalse)
    current_end_user.update(is_deleted: true)
    # ログアウトさせる
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private

  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :phone_number, :share_code)
  end
end
