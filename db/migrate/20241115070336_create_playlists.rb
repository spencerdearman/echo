class CreatePlaylists < ActiveRecord::Migration[7.1]
  def change
    create_table :playlists do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.boolean :is_public
      t.string :playlist_cover_url
      t.boolean :is_ai_generated
      t.integer :playlist_tracks_count
      t.integer :likes_count

      t.timestamps
    end
  end
end
