class CreateTracks < ActiveRecord::Migration[7.1]
  def change
    create_table :tracks do |t|
      t.string :title
      t.integer :artist_id
      t.string :album_name
      t.string :platform_id
      t.integer :duration_ms

      t.timestamps
    end
  end
end
