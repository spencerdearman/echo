class CreateTrackMoods < ActiveRecord::Migration[7.1]
  def change
    create_table :track_moods do |t|
      t.integer :track_id
      t.integer :mood_id

      t.timestamps
    end
  end
end
