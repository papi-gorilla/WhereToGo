class UsersController < ApplicationController
  before_action :autheniticate_user, {only: [:edit]}

  def show
    @user = User.find(params[:id])
    @post = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following_user
  end

  def followed
    @user = User.find(params[:id])
    @users = @user.followed_user
  end

  private
  def user_params
    params.require(:user).permit(:user_image, :user_name, :email, :introduction)
  end

end
