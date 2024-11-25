class CreateRecommendations < ActiveRecord::Migration[7.1]
  def change
    create_table :recommendations do |t|
      t.integer :user_id
      t.integer :playlist_id
      t.text :description
      t.string :recommendation_type

      t.timestamps
    end
  end
end
