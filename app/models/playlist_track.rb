# == Schema Information
#
# Table name: playlist_tracks
#
#  id          :bigint           not null, primary key
#  position    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  playlist_id :integer
#  track_id    :integer
#
class PlaylistTrack < ApplicationRecord
  # Direct Associations
  belongs_to :playlist, required: true, class_name: "Playlist", foreign_key: "playlist_id", counter_cache: true
  belongs_to :track, required: true, class_name: "Track", foreign_key: "track_id"
end
