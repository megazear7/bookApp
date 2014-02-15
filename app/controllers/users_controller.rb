class UsersController < ApplicationController

  def show
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end

    @books = @user.books.paginate(page: params[:page], per_page: 5)
  end

end
