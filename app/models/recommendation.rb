class Recommendation < ApplicationRecord
  # Direct Associations
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :playlist, required: true, class_name: "Playlist", foreign_key: "playlist_id"
end
