# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  bio                    :text
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  playlists_count        :integer
#  profile_picture_url    :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
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
