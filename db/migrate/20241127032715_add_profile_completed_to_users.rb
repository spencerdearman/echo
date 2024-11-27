class AddProfileCompletedToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :profile_completed, :boolean, default: false, null: false
  end
end
