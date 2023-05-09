class ChaptersController < ApplicationController
	before_action :find_book
	def index
		@chapters = @book.chapters.all
	end

	def show
    @chapter = @book.chapters.find(params[:id])
  end

	def new
		@chapter = @book.chapters.new
	end

	def create
		@chapter = @book.chapters.new(chapter_params)
		if @chapter.save
      redirect_to [@book, @chapter]
    else
      render :new, status: :unprocessable_entity
    end
	end

	def edit
		@chapter = @book.chapters.find_by_id(params[:id])
	end

	def update
		@chapter = @book.chapters.find_by_id(params[:id])
		if @chapter.update(chapter_params)
      redirect_to [@book, @chapter]
    else
      render :edit, status: :unprocessable_entity
    end
	end

	private

	def chapter_params
		params.require(:chapter).permit(:title, :content)
	end

	def find_book
		@book = Book.find_by_id(params[:book_id])
	end
end
