class Public::BopSubjectsController < ApplicationController
  def new
    @bop_subject = BopSubject.new
    @bop_details = @bop_subject.bop_details.build
  end

  def create
    @bop_subject = BopSubject.new(bop_subject_params)
    @bop_subject.end_user_id = current_end_user.id
    if @bop_subject.save
      #binding.pry
      redirect_to bop_subject_path(@bop_subject)
    else
      #pp @bop_subject.errors.attribute_names
      render :new
    end
  end

  def show
    @bop_subject = BopSubject.find(params[:id])
    @bop_details = @bop_subject.bop_details
    @bop_details_total = @bop_details.sum(:detail_price)
  end

  def index
    @dt = params[:date].nil? ? DateTime.current : DateTime.parse("#{params[:date]}-01").in_time_zone('Asia/Tokyo')
    beginning_of_month = @dt.beginning_of_month # 月初
    end_of_month = @dt.end_of_month # 月末
    @end_user = current_end_user
    @balance = @end_user.bop_subjects.where(bop: 0)
    @end_user_balance = @balance.where(date: beginning_of_month...end_of_month)
  end

  def destroy
    @bop_subject = BopSubject.find(params[:id])
    @bop_subject.destroy
    redirect_to end_users_path
  end

  def edit
    @bop_subject = BopSubject.find(params[:id])
  end

  def update
    @bop_subject = BopSubject.find(params[:id])
    if @bop_subject.update(bop_subject_params)
      redirect_to bop_subject_path(@bop_subject)
    else
      pp @bop_subject.errors.attribute_names
      render :edit
    end
  end

  private

  def bop_subject_params
    params.require(:bop_subject).permit(:subject_name, :bop, :total_price, :point, :date, :memo, :store, :registered_person_id, :account_book_id, bop_details_attributes: [:id, :bop_subject_id, :detail_name, :detail_price, :amount, :_destroy])
  end
end
