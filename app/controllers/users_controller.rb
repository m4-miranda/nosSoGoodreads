class UsersController < ApplicationController

  def new
    if logged_in?
      redirect_to home_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      initialize_list_user @user
      log_in @user
      flash[:success] = "Welcome to notSoGoodreads!"
      redirect_to home_path
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
