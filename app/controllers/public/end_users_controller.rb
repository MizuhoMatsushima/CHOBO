class Public::EndUsersController < ApplicationController
  def top
  end

  def show
    @end_user = current_end_user
  end

  def edit
  end

  def confirm
  end

  def search
  end
end
