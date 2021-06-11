class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :favorites

  def self.looks(search, word)
    if search == "perfect_match"
      @book = Post.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @book = Post.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @book = Post.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @book = Post.where("title LIKE?","%#{word}%")
    else
      @book = Post.all
    end
  end
end
