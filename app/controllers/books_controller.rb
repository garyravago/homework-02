class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:update, :create, :destroy]

  def index
    @books = Book.all.order(:title)
    if params[:search]
      @books = Book.search(params[:search]).order(:title)
    else
      @books = Book.all.order(:title)
    end
  end

  def show
    @book = Book.find(params[:id])
    @authors = @book.authors
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.create(book_params)
    redirect_to Book.last
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to @book
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_url
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :classification, :category, :year, :sub_title)
  end
end
