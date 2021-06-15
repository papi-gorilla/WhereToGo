class RankingsController < ApplicationController
  def index
    @ranks = Post.find(Favorite.group(:post_id).order("count(post_id) desc").limit(10).pluck(:post_id))
  end

end
