class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]
  # before_action :correct_user, only: [:show]

  def show
    @user = User.find(params[:id])
    @entries = @user.entries
  end

  def new
    @user = User.new
  end

  def index
    @user = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Fun-Learning you have earned a 10 points signing up bonus!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end
