class Public::CommentsController < ApplicationController

  def create
    @consultation = Consultation.find(params[:consultation_id])
    @comment = current_end_user.comments.new(consultation_params)
    @comment.consultation_id = @consultation.id
    @comment.save
  end

  private

  def consultation_params
    params.require(:comment).permit(:body)
  end
end
