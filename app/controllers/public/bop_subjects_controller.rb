class Public::BopSubjectsController < ApplicationController
  def new
    @bop_subject = BopSubject.new
  end

  def create
    @bop_subject = BopSubject.new(bop_subject_params)
    @bop_subject.end_user_id = current_end_user.id
    detail_list = params[:bop_subject][:bop_subject_id][:name][:use_at][:amount][:store][:registered_person_id]
    if @bop_subject.save
      @bop_subject.save_detail(detail_list)
      redirect_to account_book_path(@bop_subject.account_books_id)
    end
  end

  def show

  end

  def edit
  end

  private

  def bop_subject_params
    params.require(:bop_subject).permit(:name, :price, :point, :registered_id)
  end
end
