# == Schema Information
#
# Table name: tracks
#
#  id          :bigint           not null, primary key
#  album_name  :string
#  duration_ms :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  artist_id   :integer
#  platform_id :string
#
class Track < ApplicationRecord
  # Direct Associations
  has_many  :playlist_tracks, class_name: "PlaylistTrack", foreign_key: "track_id", dependent: :destroy
  has_many  :track_moods, class_name: "TrackMood", foreign_key: "track_id", dependent: :destroy
  belongs_to :artist, required: true, class_name: "Artist", foreign_key: "artist_id"

  # Indirect Associations
  has_many :playlists, through: :playlist_tracks, source: :playlist
end
