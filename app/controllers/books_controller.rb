class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.update(book_params)
    redirect_to book_url
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :classification, :category, :year)
  end
end
