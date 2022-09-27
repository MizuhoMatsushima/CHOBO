class Public::AccountBooksController < ApplicationController
  before_action :guest, except: [:new, :index, :edit]

  def new
    @account_book = AccountBook.new
    @source_of_incomes = current_end_user.source_of_incomes
  end

  def create
    @account_book = AccountBook.new(account_book_params)
    @account_book.end_user_id = current_end_user.id
    book_date = (params[:account_book][:book_date]+"-01").to_datetime
    @account_book.book_date = book_date
    if @account_book.save
      redirect_to end_users_path
    else
      @source_of_incomes = current_end_user.source_of_incomes
      render :new
    end
  end

  def index
    @account_books = current_end_user.account_books.order(pay_day: "DESC").page(params[:page]).per(15)
  end

  def edit
    @account_book = AccountBook.find(params[:id])
    @source_of_incomes = current_end_user.source_of_incomes
  end

  def update
    @account_book = AccountBook.find(params[:id])
    book_date = (params[:account_book][:book_date]+"-01").to_datetime
    @account_book.book_date = book_date
    if @account_book.update(account_book_params)
      redirect_to account_books_path
    else
      @source_of_incomes = current_end_user.source_of_incomes
      render :edit
    end
  end

  def destroy
    @account_book = AccountBook.find(params[:id])
    if @account_book.destroy
      redirect_to account_books_path
    else
      render template: "end_users/top"
    end
  end

  private

  def account_book_params
    params.require(:account_book).permit(:source_of_income_id, :income, :pay_day)
  end

end
