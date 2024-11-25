class CreateUserPreferences < ActiveRecord::Migration[7.1]
  def change
    create_table :user_preferences do |t|
      t.integer :user_id
      t.string :preference_key
      t.string :preference_value

      t.timestamps
    end
  end
end
