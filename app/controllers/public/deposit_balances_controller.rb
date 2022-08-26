class Public::DepositBalancesController < ApplicationController

  def index
    @end_user = current_end_user
    @deposit_balances = @end_user.deposit_balances.order(created: "DESC")
    @deposit_balance = DepositBalance.new
    @savings_estinations = @end_user.savings_estinations
  end

  def create
    @end_user = current_end_user
    @deposit_balances = @end_user.deposit_balances
    @deposit_balance = DepositBalance.new(deposit_balance_params)
    @deposit_balance.end_user_id = current_end_user.id
    if @deposit_balance.save
      redirect_to deposit_balances_path
    else
      @savings_estinations = @end_user.savings_estinations
      render :index
    end
  end

  def edit
    @end_user = current_end_user
    @deposit_balance = DepositBalance.find(params[:id])
    @savings_estinations = @end_user.savings_estinations
  end

  def update
    @end_user = current_end_user
    @deposit_balance = DepositBalance.find(params[:id])
    if @deposit_balance.update(deposit_balance_params)
      redirect_to deposit_balances_path
    else
      @savings_estinations = @end_user.savings_estinations
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
