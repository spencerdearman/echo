# == Schema Information
#
# Table name: track_moods
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  mood_id    :integer
#  track_id   :integer
#
class TrackMood < ApplicationRecord
  # Direct Associations
  belongs_to :track, required: true, class_name: "Track", foreign_key: "track_id"
  belongs_to :mood, required: true, class_name: "Mood", foreign_key: "mood_id"
end
