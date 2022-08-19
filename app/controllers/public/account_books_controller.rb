class Public::AccountBooksController < ApplicationController

  def new
    @account_book = AccountBook.new
  end

  def create
    @account_book = AccountBook.new(account_book_params)
    @account_book.end_user_id = current_end_user.id
    @account_book.save
    redirect_to end_users_path
  end

  def show
    @account_book = AccountBook.find(params[:id])
    @bop_subjects = BopSubject.all
  end

  def index
    @account_books = AccountBook.all
  end

  def edit
  end

  private

  def account_book_params
    params.require(:account_book).permit(:source_of_income_id, :income, :pay_day)
  end

end
