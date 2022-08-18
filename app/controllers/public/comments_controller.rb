class Public::CommentsController < ApplicationController

  def create
    @consultation = Consultation.find(params[:consultation_id])
    @consultation_tags = @consultation.tags
    @comment = current_end_user.comments.new(comment_params)
    @comment.consultation_id = @consultation.id
    @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
