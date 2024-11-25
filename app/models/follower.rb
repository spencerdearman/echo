# == Schema Information
#
# Table name: followers
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  followed_id :integer
#  follower_id :integer
#
class Follower < ApplicationRecord
  # Direct Associations
  belongs_to :follower, required: true, class_name: "User", foreign_key: "follower_id"
  belongs_to :followed, required: true, class_name: "User", foreign_key: "followed_id"
end
