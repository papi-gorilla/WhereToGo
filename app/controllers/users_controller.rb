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
    @user.save(user_params)
    redirect_to user_path(@user)
  end

  private
　def user_params
　  params.require(:user).permit(:user_image, :user_name, :introduction)
　end

end
