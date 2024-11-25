# == Schema Information
#
# Table name: artists
#
#  id          :bigint           not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  platform_id :string
#
class Artist < ApplicationRecord
  # Direct Associations
  has_many  :tracks, class_name: "Track", foreign_key: "artist_id", dependent: :destroy
end
