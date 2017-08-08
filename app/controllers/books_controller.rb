class BooksController < ApplicationController
  def index
    @books = ["Book 1", "Book 2", "Book 3"]
  end
end
