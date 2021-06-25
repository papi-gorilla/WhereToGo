class PostsController < ApplicationController
  before_action :autheniticate_user, {only: [:new, :edit]}

  def new
    @post = Post.new
    @course = @post.courses.build
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @course = Course.new
    if @post.save
      redirect_to post_path(@post)
    else
      render "new"
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @course = Course.new
    @courses = @post.courses.order(:day)
    @comment = Comment.new
    @comments = @post.comments
    impressionist(@post, nil, unique: [:session_hash.to_s])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, courses_attributes: [:departure_point, :way_point1, :way_point2, :way_point3, :way_point4, :way_point5, :way_point6, :way_point7, :way_point8, :arrival_point, :day])
  end

end
