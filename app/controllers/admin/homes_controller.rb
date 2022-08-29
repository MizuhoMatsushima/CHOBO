class Admin::HomesController < ApplicationController
  def top
    @end_users = EndUser.order(end_user_id: "ASC").page(params[:page])
  end
end
