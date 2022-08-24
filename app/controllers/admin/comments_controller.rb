class Admin::CommentsController < ApplicationController

  def destroy
    @consultation = Consultation.find(params[:consultation_id])
    #@consultation_tags = @consultation.tags
    @comment = Comment.find(params[:id])
    @comment.update(body: "このコメントは管理者によって削除されました")
    #redirect_back(fallback_location: root_path)
  end
end
