class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post = @user.posts
  end
  
  def edit
  end
  
  def update
  end
  
  private
  

end
