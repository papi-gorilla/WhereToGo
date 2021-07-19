class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :following, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :following, source: :followed
  has_many :followed_user, through: :followed, source: :following
  has_many :active_notifications, class_name: "Notification", foreign_key: "visitor_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

  validates :user_name, length: {maximum: 20}, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  attachment :user_image

  # フォロー・フォロー解除のメソッド
  def follow(user_id)
    following.create(followed_id: user_id)
  end

  def unfollow(user_id)
    following.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    following_user.include?(user)
  end

  # 自分がフォローされた際の通知を作成・保存
  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, "follow"])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: "follow"
      )
      notification.save if notification.valid?
    end
  end

  # 入力されたキーワードと完全一致及び部分一致しているユーザーを検索
  def self.looks(search, word)
    @user = User.where("user_name LIKE?","%#{word}%")
  end

end
