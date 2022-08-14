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
      # @bop_detail = Bopdetail.new(bop_subject_params)
      # @bop_detail.

      redirect_to bop_subject_path(@bop_subject)
    else
      render :new
    end
  end

  def show
    @bop_subject = BopSubject.find(params[:id])
    @bop_details = @bop_subject.bop_details
  end

  def edit
  end

  private

  def bop_subject_params
    params.require(:bop_subject).permit(:subject_name, :bop, :price, :point, :use_at, :memo, :registered_person_id, :account_book_id, bop_details_attributes: [:id, :bop_subject_id, :detail_name, :detail_price, :amount, :store, :_destroy])
  end
end
