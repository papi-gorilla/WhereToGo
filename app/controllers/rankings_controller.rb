class RankingsController < ApplicationController
  def index
    # 投稿詳細ページへのアクセス数の多い順に10件の投稿を
    @posts = Post.order("impressions_count DESC").take(10)
  end

end
