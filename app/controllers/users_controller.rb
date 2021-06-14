class UsersController < ApplicationController
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
  
  private
  def user_params
    params.require(:user).permit(:user_image, :name, :user_name, :email, :introduction)
  end

end
