class Public::SourceOfIncomesController < ApplicationController
  before_action :guest, except: [:index, :edit]

  def index
    @end_user = current_end_user
    @source_of_income = SourceOfIncome.new
    @source_of_incomes = @end_user.source_of_incomes.all
  end

  def create
    @end_user = current_end_user
    @source_of_income = SourceOfIncome.new(source_of_income_params)
    @source_of_income.end_user_id = current_end_user.id
    @source_of_incomes = @end_user.source_of_incomes.all
    if @source_of_income.save
      redirect_to source_of_incomes_path
    else
      render :index
    end
  end

  def edit
    @source_of_income = SourceOfIncome.find(params[:id])
  end

  def update
    @source_of_income = SourceOfIncome.find(params[:id])
    if @source_of_income.update(source_of_income_params)
      redirect_to source_of_incomes_path
    else
      render :edit
    end
  end

  private

  def source_of_income_params
    params.require(:source_of_income).permit(:source_name)
  end
end
