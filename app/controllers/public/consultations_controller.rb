class Public::ConsultationsController < ApplicationController
  #before_action :guest, except: [:new, :show, :index, :my_index, :search]

  def index
    @consultations = Consultation.all.order(created_at: "DESC").page(params[:page])
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
    tag_valid = Tag.valid_tags(tag_list)
    if @consultation.valid? && tag_valid
      @consultation.save!
      @consultation.save_tag(tag_list)
      redirect_to consultation_path(@consultation)
    else
      if ! tag_valid
        @consultation.errors.add(:name, "を正しく入力してください")
      end
      render :new
    end
  end

  def my_index
    @end_user = current_end_user
    @consultations = @end_user.consultations.page(params[:page])
    @name = @end_user.full_name + "さんの"
  end

  def search
    @consultations = Consultation.all
    @tags = Tag.all
    @name = ""
    if params[:keyword] == ""
      flash[:keyword] = "キーワードを入力してください"
      redirect_to consultations_path
    else
      if (params[:keyword])[0] == '#'
        @consultation = Tag.search(params[:keyword]).order('created_at DESC').page(params[:page])
        # redirect_to consultations_path
      else
        @consultation = Consultation.search(params[:keyword]).order('created_at DESC').page(params[:page])
        # redirect_to consultations_path
      end
    end
  end


  private

  def consultation_params
    params.require(:consultation).permit(:title, :body)
  end
end
