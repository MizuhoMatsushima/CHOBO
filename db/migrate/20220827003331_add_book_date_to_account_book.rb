class AddBookDateToAccountBook < ActiveRecord::Migration[6.1]
  def change
    add_column :account_books, :book_date, :datetime
  end
end
