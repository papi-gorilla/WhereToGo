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
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @course = Course.new
    @courses = @post.courses.order(:day)
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
    # 投稿詳細ページへのアクセス数を取得
    impressionist(@post, nil, unique: [:session_hash.to_s])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, courses_attributes: [:departure_point, :way_point1, :way_point2, :way_point3, :way_point4, :way_point5, :way_point6, :way_point7, :way_point8, :arrival_point, :day])
  end

end
