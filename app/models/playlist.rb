# == Schema Information
#
# Table name: playlists
#
#  id                    :bigint           not null, primary key
#  description           :text
#  is_ai_generated       :boolean
#  is_public             :boolean
#  likes_count           :integer
#  name                  :string
#  playlist_cover_url    :string
#  playlist_tracks_count :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  user_id               :integer
#
class Playlist < ApplicationRecord
  # Direct Associations
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: true
  has_many  :playlist_tracks, class_name: "PlaylistTrack", foreign_key: "playlist_id", dependent: :destroy
  has_many  :likes, class_name: "Like", foreign_key: "playlist_id", dependent: :destroy
  has_many  :recommendations, class_name: "Recommendation", foreign_key: "playlist_id", dependent: :destroy

  # Indirect Associations
  has_many :tracks, through: :playlist_tracks, source: :track
end
