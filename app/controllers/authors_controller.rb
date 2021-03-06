class AuthorsController < ApplicationController
	before_action :authenticate_user!, only: [:update, :create, :destroy]

	def show
		@author = Author.find(params[:id])
		@books = @author.books
	end

	def new
		@author = Author.new
	end

	def edit
		@author = Author.find(params[:id])
	end
	
	def create
		@author = Author.create(author_params)
		redirect_to author_url(@author)
	end

	def update
		@author = Author.find(params[:id])
		@author.update(author_params)
		redirect_to author_url(@author)
	end

	def destroy
		@author = Author.find(params[:id])
		@author.destroy
		redirect_to root_url
	end

	private
		
	def author_params
		params.require(:author).permit(:first_name, :last_name, :age)
	end
end
