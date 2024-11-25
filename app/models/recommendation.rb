# == Schema Information
#
# Table name: recommendations
#
#  id                  :bigint           not null, primary key
#  description         :text
#  recommendation_type :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  playlist_id         :integer
#  user_id             :integer
#
class Recommendation < ApplicationRecord
  # Direct Associations
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :playlist, required: true, class_name: "Playlist", foreign_key: "playlist_id"
end
