class CreatePlaylistTracks < ActiveRecord::Migration[7.1]
  def change
    create_table :playlist_tracks do |t|
      t.integer :playlist_id
      t.integer :track_id
      t.integer :position

      t.timestamps
    end
  end
end
