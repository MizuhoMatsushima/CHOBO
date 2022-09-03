class Admin::ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.all.order(created_at: "DESC").page(params[:page])
    @tags = Tag.all
  end

  def show
    @consultation = Consultation.find(params[:id])
    @consultation_tags = @consultation.tags
    @comment = Comment.new
    #@comments = Consultation.comments.page(params[:page])
  end

  def edit
    @consultation = Consultation.find(params[:id])
    @consultation_tags = @consultation.tags
  end

  def update
    @consultation = Consultation.find(params[:id])
    @consultation.score = Language.get_data(consultation_params[:body])
    if @consultation.update(consultation_params)
      redirect_to admin_consultation_path(@consultation)
    else
      render :edit
    end
  end

  def destroy
    @consultation = Consultation.find(params[:id])
    @consultation.destroy
    redirect_to admin_consultations_path
  end

  def search
    @consultations = Consultation.all
    @tags = Tag.all
    if params[:keyword] == ""
      flash[:keyword] = "キーワードを入力してください"
      redirect_to admin_consultations_path
    elsif (params[:keyword])[0] == '#'
      @consultation = Tag.search(params[:keyword]).order('created_at DESC').page(params[:page])
    else
      @consultation = Consultation.search(params[:keyword]).order('created_at DESC').page(params[:page])
    end
  end

  def ai_search
    score = params[:score]
    check = params[:check]
    @records = Consultation.ai_search(score, check).page(params[:page]).order(created_at: "DESC")
  end

  private

  def consultation_params
    params.require(:consultation).permit(:title, :body, :emotion_check)
  end
end
