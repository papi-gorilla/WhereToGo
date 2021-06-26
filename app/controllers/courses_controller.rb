class CoursesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @course = Course.new(course_params)
    @course.post_id = @post.id
    if @course.save
      redirect_to post_path(@post)
    else
      @courses = @post.courses.order(:day)
      @comment = Comment.new
      @comments = @post.comments
      render "posts/show"
    end
  end

  def edit
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_back(fallback_location: course_path(@course))
  end

  private
  def course_params
    params.require(:course).permit(:departure_point, :way_point1, :way_point2, :way_point3, :way_point4, :way_point5, :way_point6, :way_point7, :way_point8, :arrival_point, :day)
  end

end
