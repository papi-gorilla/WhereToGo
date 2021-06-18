class RankingsController < ApplicationController
  def index
    @ranks = Post.order("impressions_count DESC").take(10)
  end

end
