class RelationshipsController < ApplicationController
  def follow
    @user = User.find(params[:id])
    user = User.find(params[:id])
    current_user.follow(params[:id])
    user.create_notification_follow!(current_user)
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] == "users" && path[:actions] == "following"
      render templete: "users/user_index"
    elsif path[:controller] == "users" && path[:actions] == "followed"
      render templete: "users/user_index"
    elsif path[:controller] == "searches" && path[:actions] == "index"
      render templete: "users/user_index"
    elsif path[:controller] == "users" && path[:actions] == "show"
      render templete: "users/user_follow"
    end
  end

  def unfollow
    @user = User.find(params[:id])
    user = User.find(params[:id])
    current_user.unfollow(params[:id])
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] == "users" && path[:actions] == "following"
      render templete: "users/user_index"
    elsif path[:controller] == "users" && path[:actions] == "followed"
      render templete: "users/user_index"
    elsif path[:controller] == "searches" && path[:actions] == "index"
      render templete: "users/user_index"
    end
  end

end
