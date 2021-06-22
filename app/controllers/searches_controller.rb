class SearchesController < ApplicationController
  def index
    @range = params[:range]
    if @range == "Post"
      @posts = Post.looks(params[:search], params[:word])
    else @range == "User"
      @users = User.looks(params[:search], params[:word])
    end
  end

end
