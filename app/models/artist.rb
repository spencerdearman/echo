class Artist < ApplicationRecord
  # Direct Associations
  has_many  :tracks, class_name: "Track", foreign_key: "artist_id", dependent: :destroy
end
