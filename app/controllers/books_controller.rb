class BooksController < ApplicationController
	before_action :find_book, except: %i[new, create]
	def index
		@books = Book.all
	end

	def show
  end

	def new
		@book = Book.new
	end

	def create
		@book = current_user.books.new(book_params)
		if @book.save
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
	end

	def edit
		@book = Book.find_by_id(params[:id])
	end

	def update
		if @book.update(book_params)
      redirect_to @book
    else
      render :edit, status: :unprocessable_entity
    end
	end

	private

	def book_params
		params.require(:book).permit(:title, :description)
	end

	def find_book
		@book = current_user.books.find_by_id(params[:id])
	end
end
