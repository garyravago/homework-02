class AuthorsController < ApplicationController

	def show
		@author = Author.find(params[:id])
	end

	def new
		@author = Author.new
	end

	def edit
	end
	
	def create
		@author = Author.create(author_params)
		redirect_to author_url(@author)
	end

	def update
	end

	def destroy
	end

	private
		
	def author_params
		params.require(:author).permit(:first_name, :last_name, :age)
	end
end
