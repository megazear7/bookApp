class BooksController < ApplicationController

  def new
    if user_signed_in? 
      @user = current_user
    else
      redirect_to new_user_session_path
    end

    @book = Book.new
  end

  def create
    if user_signed_in? 
      @user = current_user
    else
      redirect_to new_user_session_path
    end

    @book = Book.create(book_params)
    @book.save
    redirect_to book_path(@book)
  end

  def show
    @book = Book.find(book_id) 
  end

  def index
    @books = Book.all
  end

  private
   def book_params
      params.require(:book).permit(:title, :author, :short_description, :long_description)
   end

  private
    def book_id
      params.require(:id)
    end

end
