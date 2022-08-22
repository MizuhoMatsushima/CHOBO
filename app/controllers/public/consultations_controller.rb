class Public::ConsultationsController < ApplicationController

  def index
    @consultations = Consultation.all
    @tags = Tag.all
    @name = ""
  end

  def show
    @consultation = Consultation.find(params[:id])
    @consultation_tags = @consultation.tags
    @comment = Comment.new
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
    @end_user = current_end_user
    @consultations = @end_user.consultations
    @name = @end_user.full_name + "さんの"
  end

  def search
    @consultations = Consultation.all
    @tags = Tag.all
    @name = ""
    if (params[:keyword])[0] == '#'
      @consultation = Tag.search(params[:keyword]).order('created_at asc')
      # redirect_to consultations_path
    else
      @consultation = Consultation.search(params[:keyword]).order('created_at asc')
      # redirect_to consultations_path
    end
  end


  private

  def consultation_params
    params.require(:consultation).permit(:title, :body)
  end
end
