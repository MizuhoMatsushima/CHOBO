class Admin::ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.all.order(created_at: "DESC").page(params[:page])
    @tags = Tag.all
  end

  def show
    @consultation = Consultation.find(params[:id])
    @consultation_tags = @consultation.tags
    @comment = Comment.new
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
end
