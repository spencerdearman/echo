# == Schema Information
#
# Table name: moods
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Mood < ApplicationRecord
  # Direct Associations
  has_many  :track_moods, class_name: "TrackMood", foreign_key: "mood_id", dependent: :destroy
end
