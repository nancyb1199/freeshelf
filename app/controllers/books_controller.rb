class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
      @books = Book.all
  end

  def show
      @book = Book.find(params[:id])
  end

  def new
  end

  def edit
    if session[:user_id] == Book.find(params[:id]).user_id
      @book = Book.find(params[:id])
    else
      render 'not_auth'
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = session[:user_id]
    @book.save
    redirect_to @book
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

def destroy

  if session[:user_id] == Book.find(params[:id]).user_id
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  else
    render 'not_auth'
  end
end

  private
    def book_params
      params.require(:book).permit(:title, :author, :description, :url, :user_id)
    end

end
