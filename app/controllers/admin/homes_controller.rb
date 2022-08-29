class Admin::HomesController < ApplicationController
  def top
    @end_users = EndUser.order(id: "ASC").page(params[:page])
  end
end
