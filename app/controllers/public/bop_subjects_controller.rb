class Public::BopSubjectsController < ApplicationController
  def new
    @bop_subject = BopSubject.new
    @bop_details = @bop_subject.bop_details.build
  end

  def create
    @bop_subject = BopSubject.new(bop_subject_params)
    @bop_subject.end_user_id = current_end_user.id
    if @bop_subject.save
      redirect_to bop_subject_path(@bop_subject)
    else
      render :new
    end
  end

  def show

  end

  def edit
  end

  private

  def bop_subject_params
    params.require(:bop_subject).permit(:subject_name, :bop, :price, :point, :memo, :registered_person_id, :account_book_id, bop_detail_attributes: [:id, :bop_subject_id, :detail_name, :use_at, :detail_price, :amount, :store])
  end
end
