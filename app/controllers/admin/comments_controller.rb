class Admin::CommentsController < ApplicationController

  def destroy
    @consultation = Consultation.find(params[:consultation_id])
    @comment = Comment.find(params[:id])
    @comment.update(body: "このコメントは管理者によって削除されました")
  end
end
