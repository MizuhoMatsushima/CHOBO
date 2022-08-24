class Admin::HomesController < ApplicationController
  def top
    @end_users = EndUser.order(end_user_id: :asc).page(params[:page]).per(5)
  end
end
