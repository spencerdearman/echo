# == Schema Information
#
# Table name: likes
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  playlist_id :integer
#  user_id     :integer
#
class Like < ApplicationRecord
  # Direct Associations
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :playlist, required: true, class_name: "Playlist", foreign_key: "playlist_id", counter_cache: true
end
