class Mood < ApplicationRecord
  # Direct Associations
  has_many  :track_moods, class_name: "TrackMood", foreign_key: "mood_id", dependent: :destroy
end
