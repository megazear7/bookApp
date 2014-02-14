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

    @book = @user.books.create(book_params)
    @chapter = @book.chapters.create(chapter_params)
    @chapter.save
    @book.save
    redirect_to book_path(@book)
  end

  def show
    @book = Book.find(book_id) 
  end

  def index
    @books = Book.all
  end

  def destroy
    if user_signed_in? 
      @user = current_user
    else
      redirect_to new_user_session_path
    end

    @user.books.destroy(params[:id])
    redirect_to user_path(@user)
  end

  private
   def book_params
      params.require(:book).permit(:title, :author, :short_description, :long_description)
   end

  private
    def book_id
      params.require(:id)
    end

  private 
    def chapter_params
      params.require(:book).require(:chapters).permit(:title, :content, :position)
    end

end
