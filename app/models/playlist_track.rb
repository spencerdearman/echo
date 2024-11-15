class PlaylistTrack < ApplicationRecord
  # Direct Associations
  belongs_to :playlist, required: true, class_name: "Playlist", foreign_key: "playlist_id", counter_cache: true
  belongs_to :track, required: true, class_name: "Track", foreign_key: "track_id"
end
