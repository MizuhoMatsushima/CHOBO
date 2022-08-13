class Admin::EndUsersController < ApplicationController
  def show
    @end_user = EndUser.find(params[:id])
  end

  def search
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end
end
