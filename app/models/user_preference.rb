# == Schema Information
#
# Table name: user_preferences
#
#  id               :bigint           not null, primary key
#  preference_key   :string
#  preference_value :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#
class UserPreference < ApplicationRecord
  # Direct Associations
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
end
