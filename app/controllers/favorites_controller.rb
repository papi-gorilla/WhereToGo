class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    if @post.user != current_user
      favorite = current_user.favorites.new(post_id: @post.id)
      favorite.save
      @post.create_notification_favorite!(current_user)
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: @post.id)
    favorite.destroy
  end

end
