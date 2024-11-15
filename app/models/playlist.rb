class Playlist < ApplicationRecord
  # Direct Associations
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: true
  has_many  :playlist_tracks, class_name: "PlaylistTrack", foreign_key: "playlist_id", dependent: :destroy
  has_many  :likes, class_name: "Like", foreign_key: "playlist_id", dependent: :destroy
  has_many  :recommendations, class_name: "Recommendation", foreign_key: "playlist_id", dependent: :destroy

  # Indirect Associations
  has_many :tracks, through: :playlist_tracks, source: :track
end
