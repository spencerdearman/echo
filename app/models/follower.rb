class Follower < ApplicationRecord
  # Direct Associations
  belongs_to :follower, required: true, class_name: "User", foreign_key: "follower_id"
  belongs_to :followed, required: true, class_name: "User", foreign_key: "followed_id"
end
