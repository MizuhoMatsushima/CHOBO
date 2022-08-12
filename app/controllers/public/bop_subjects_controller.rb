class Public::BopSubjectsController < ApplicationController
  def new
    @bop_subject = BopSubject.new
  end

  def create
    @bop_subject = BopSubject.new(bop_subject_params)
    @bop_subject.end_user_id = current_end_user.id
    detail_list = params[:bop_subject][:detail_name]
    if @bop_subject.save
      @bop_subject.save_detail(detail_list)
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
    params.require(:bop_subject).permit(:subject_name, :bop, :price, :point, :memo, :registered_person_id)
  end
end
