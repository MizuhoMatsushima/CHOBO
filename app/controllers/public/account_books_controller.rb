class Public::AccountBooksController < ApplicationController

  def new
    @account_book = AccountBook.new
  end

  def create
    @account_book = AccountBook.new(account_book_params)
    @account_book.save
    redirect_to end_users_path
  end

  def show
  end

  def edit
  end

  private

  def accont_book_params
    params.require(:account_book).permit(:name)
  end

end
