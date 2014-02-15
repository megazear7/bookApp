class BooksController < ApplicationController

  def new
    if user_signed_in? 
      @user = current_user
    else
      redirect_to new_user_session_path
    end

    @book = Book.new
    3.times { @book.chapters.build }
  end

  def edit
    if user_signed_in? 
      @user = current_user
    else
      redirect_to new_user_session_path
    end
    @book = @user.books.find(book_id) 
  end

  def create
    if user_signed_in? 
      @user = current_user
    else
      redirect_to new_user_session_path
    end

    @book = @user.books.create(book_params)

    if @book.save
      flash[:notice] = "Successfully created survey"
      redirect_to book_path(@book)
    else
      render :action => 'new'
    end
  end

  def update
    if user_signed_in? 
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  
    @book = @user.books.find(book_id)
    @book.update(book_params)

    if @book.save
      flash[:notice] = "Successfully updated book"
      redirect_to book_path(@book)
    else
      render :action => 'new'
    end

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
      params.require(:book).permit(:title, :author, :short_description, :long_description, chapters_attributes: [:id, :title, :content, :position, :_destroy])
   end

  private
    def book_id
      params.require(:id)
    end

end
