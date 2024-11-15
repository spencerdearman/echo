class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # Direct Associations
  has_many  :playlists, class_name: "Playlist", foreign_key: "user_id", dependent: :destroy
  has_many  :followers, class_name: "Follower", foreign_key: "follower_id", dependent: :destroy
  has_many  :follows, class_name: "Follower", foreign_key: "followed_id", dependent: :destroy
  has_many  :likes, class_name: "Like", foreign_key: "user_id", dependent: :destroy
  has_many  :user_preferences, class_name: "UserPreference", foreign_key: "user_id", dependent: :destroy
  has_many  :recommendations, class_name: "Recommendation", foreign_key: "user_id", dependent: :destroy

  # Indirect Associations
  has_many :followed_users, through: :followers, source: :followed
  has_many :reverse_followers, through: :follows, source: :follower
end
