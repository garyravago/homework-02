class CatalogController < ApplicationController
	def index
		#if params[:search]
      @books = Book.search(params[:search]).order(:title)
    #else
	end
end
