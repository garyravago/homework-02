class CatalogController < ApplicationController
	def index
    @books = Book.search(params[:search]).order(:title).page params[:page]
	end
end
