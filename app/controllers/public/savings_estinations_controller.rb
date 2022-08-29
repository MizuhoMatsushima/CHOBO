class Public::SavingsEstinationsController < ApplicationController
  before_action :guest, except: [:index, :edit]

  def index
    @end_user = current_end_user
    @savings_estination = SavingsEstination.new
    @savings_estinations = @end_user.savings_estinations.page(params[:page]).per(10)
  end

  def create
    @end_user = current_end_user
    @savings_estination = SavingsEstination.new(savings_estination_params)
    @savings_estination.end_user_id = current_end_user.id
    if @savings_estination.save
      redirect_to savings_estinations_path
    else
      @savings_estinations = @end_user.savings_estinations.page(params[:page]).per(10)
      render :index
    end
  end

  def edit
    @savings_estination = SavingsEstination.find(params[:id])
  end

  def update
    @savings_estination = SavingsEstination.find(params[:id])
    if @savings_estination.update(savings_estination_params)
      redirect_to savings_estinations_path
    else
      render :edit
    end
  end

  private

  def savings_estination_params
    params.require(:savings_estination).permit(:savings_estination_name)
  end
end
