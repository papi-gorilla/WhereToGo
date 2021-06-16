class RelationshipsController < ApplicationController
  def follow
    user = User.find(params[:id])
    current_user.follow(params[:id])
    user.create_notification_follow!(current_user)
    redirect_to user_path(user)
  end

  def unfollow
    user = User.find(params[:id])
    current_user.unfollow(params[:id])
    redirect_to user_path(user)
  end

end
