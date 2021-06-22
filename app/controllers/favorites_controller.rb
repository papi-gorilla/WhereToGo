class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    if user_signed_in?
      favorite = current_user.favorites.new(post_id: post.id)
      favorite.save
      post.create_notification_favorite!(current_user)
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end

end
