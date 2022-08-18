class Public::SourceOfIncomesController < ApplicationController

  def index
    @source_of_income = SourceOfIncome.new
    @source_of_incomes = SourceOfIncome.all
  end

  def create
    @source_of_income = SourceOfIncome.new(source_of_income_params)
    @source_of_income.end_user_id = current_end_user.id
    if @source_of_income.save
      redirect_to source_of_incomes_path
    else
      render index
    end
  end

  def edit
  end

  private

  def source_of_income_params
    params.require(:source_of_income).permit(:source_name)
  end
end
