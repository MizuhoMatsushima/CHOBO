class Public::DepositBalancesController < ApplicationController
  before_action :guest, except: [:new, :index, :edit]

  def new
    @deposit_balance = DepositBalance.new
    @savings_estinations = current_end_user.savings_estinations
  end

  def index
    @deposit_balances = current_end_user.deposit_balances.order(deposit_date: "DESC").page(params[:page]).per(10)
    @savings_estinations = current_end_user.savings_estinations.page(params[:page]).per(10)
  end

  def create
    @deposit_balance = DepositBalance.new(deposit_balance_params)
    @deposit_balance.end_user_id = current_end_user.id
    deposit_date = (params[:deposit_balance][:deposit_date]+"-01").to_datetime
    @deposit_balance.deposit_date = deposit_date
    if @deposit_balance.save
      redirect_to deposit_balances_path
    else
      @savings_estinations = current_end_user.savings_estinations
      render :new
    end
  end

  def edit
    @deposit_balance = DepositBalance.find(params[:id])
    @savings_estinations = current_end_user.savings_estinations
  end

  def update
    @deposit_balance = DepositBalance.find(params[:id])
    deposit_date = (params[:deposit_balance][:deposit_date]+"-01").to_datetime
    @deposit_balance.deposit_date = deposit_date
    if @deposit_balance.update(deposit_balance_params)
      redirect_to deposit_balances_path
    else
      @savings_estinations = current_end_user.savings_estinations
      render :edit
    end
  end

  def destroy
    @deposit_balance = DepositBalance.find(params[:id])
    @deposit_balance.destroy
    redirect_to deposit_balances_path
  end

  private

  def deposit_balance_params
    params.require(:deposit_balance).permit(:savings_amount, :savings_estination_id)
  end
end
