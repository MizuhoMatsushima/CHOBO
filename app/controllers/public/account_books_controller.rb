class Public::AccountBooksController < ApplicationController

  def new
    @account_book = AccountBook.new
  end

  def create
    @account_book = AccountBook.new(account_book_params)
    @account_book.end_user_id = current_end_user.id
    if @account_book.save
      redirect_to end_users_path
    else
      render :new
    end
  end

  def index
    @end_user = current_end_user
    @account_books = @end_user.account_books
  end

  def edit
    @account_book = AccountBook.find(params[:id])
  end

  def update
    @account_book = AccountBook.find(params[:id])
    if @account_book.update(account_book_params)
      redirect_to account_books_path
    else
      render :edit
    end
  end

  def destroy
    @account_book = AccountBook.find(params[:id])
    if @account_book.destroy
      redirect_to account_books_path
    end
  end

  private

  def account_book_params
    params.require(:account_book).permit(:source_of_income_id, :income, :pay_day)
  end

end
