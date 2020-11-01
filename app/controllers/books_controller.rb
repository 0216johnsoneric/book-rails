class BooksController < ApplicationController
before_action :redirect_if_not_logged_in

    def index
        if params[:q]
            @books = Book.search(params[:q])
        else
            @books = Book.alpha.all
        end
    end

    def show
        @book = Book.find_by_id(params[:id])
    end

    def new
        @book = Book.new
    end

    def create
        @book = current_user.books.build(recipe_params)
        if @book.save
            redirect_to book_path(@book)
        else
            render :new
        end
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = current_user.books.find(params[:id])
     
        if @book.update(book_params)
            redirect_to book_path(@book)
        else
            @error = @book.errors.full_messages
            render :edit
        end
    end

    private

    def book_params 
        params.require(:book).permit(:title, :author, :genre, :pages, :description)
    end

end
