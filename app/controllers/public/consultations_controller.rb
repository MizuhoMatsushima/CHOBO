class Public::ConsultationsController < ApplicationController

  def index
    @consultations = Consultation.all
    @tag_list = Tag.all
  end

  def show
    @consultation = Consultation.find(params[:id])
    @consultation_tags = @consultation.tags
  end

  def new
    @consultation = Consultation.new
  end

  def create
    @consultation = Consultation.new(consultation_params)
    @consultation.end_user_id = current_end_user.id
    tag_list = params[:consultation][:name].split(',')
    if @consultation.save
      @consultation.save_tag(tag_list)
      redirect_to consultation_path(@consultation)
    else
      render :new
    end
  end

  def my_index
  end

  private

  def consultation_params
    params.require(:consultation).permit(:title, :body)
  end
end
