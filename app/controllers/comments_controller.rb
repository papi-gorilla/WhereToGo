class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    comment = @post.comments.new(comment_params)
    comment.user_id = current_user.id
    comment_post = comment.post
    if comment.save
      comment_post.create_notification_comment!(current_user, comment.id)
      redirect_to post_path(@post)
    else
      redirect_to request.referer
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @comment = current_user.comments.find_by(post_id: @post.id)
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end

end
