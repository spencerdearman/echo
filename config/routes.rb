Rails.application.routes.draw do
  root to: "home#home"  

  get("/profile_configuration", { :controller => "users", :action => "profile_configuration" })
  post("/profile_configuration", { :controller => "users", :action => "update_profile" })

  # Routes for the Track mood resource:

  # CREATE
  post("/insert_track_mood", { :controller => "track_moods", :action => "create" })
          
  # READ
  get("/track_moods", { :controller => "track_moods", :action => "index" })
  
  get("/track_moods/:path_id", { :controller => "track_moods", :action => "show" })
  
  # UPDATE
  
  post("/modify_track_mood/:path_id", { :controller => "track_moods", :action => "update" })
  
  # DELETE
  get("/delete_track_mood/:path_id", { :controller => "track_moods", :action => "destroy" })

  #------------------------------

  # Routes for the Mood resource:

  # CREATE
  post("/insert_mood", { :controller => "moods", :action => "create" })
          
  # READ
  get("/moods", { :controller => "moods", :action => "index" })
  
  get("/moods/:path_id", { :controller => "moods", :action => "show" })
  
  # UPDATE
  
  post("/modify_mood/:path_id", { :controller => "moods", :action => "update" })
  
  # DELETE
  get("/delete_mood/:path_id", { :controller => "moods", :action => "destroy" })

  #------------------------------

  # Routes for the Recommendation resource:

  # CREATE
  post("/insert_recommendation", { :controller => "recommendations", :action => "create" })
          
  # READ
  get("/recommendations", { :controller => "recommendations", :action => "index" })
  
  get("/recommendations/:path_id", { :controller => "recommendations", :action => "show" })
  
  # UPDATE
  
  post("/modify_recommendation/:path_id", { :controller => "recommendations", :action => "update" })
  
  # DELETE
  get("/delete_recommendation/:path_id", { :controller => "recommendations", :action => "destroy" })

  #------------------------------

  # Routes for the User preference resource:

  # CREATE
  post("/insert_user_preference", { :controller => "user_preferences", :action => "create" })
          
  # READ
  get("/user_preferences", { :controller => "user_preferences", :action => "index" })
  
  get("/user_preferences/:path_id", { :controller => "user_preferences", :action => "show" })
  
  # UPDATE
  
  post("/modify_user_preference/:path_id", { :controller => "user_preferences", :action => "update" })
  
  # DELETE
  get("/delete_user_preference/:path_id", { :controller => "user_preferences", :action => "destroy" })

  #------------------------------

  # Routes for the Artist resource:

  # CREATE
  post("/insert_artist", { :controller => "artists", :action => "create" })
          
  # READ
  get("/artists", { :controller => "artists", :action => "index" })
  
  get("/artists/:path_id", { :controller => "artists", :action => "show" })
  
  # UPDATE
  
  post("/modify_artist/:path_id", { :controller => "artists", :action => "update" })
  
  # DELETE
  get("/delete_artist/:path_id", { :controller => "artists", :action => "destroy" })

  #------------------------------

  # Routes for the Like resource:

  # CREATE
  post("/insert_like", { :controller => "likes", :action => "create" })
          
  # READ
  get("/likes", { :controller => "likes", :action => "index" })
  
  get("/likes/:path_id", { :controller => "likes", :action => "show" })
  
  # UPDATE
  
  post("/modify_like/:path_id", { :controller => "likes", :action => "update" })
  
  # DELETE
  get("/delete_like/:path_id", { :controller => "likes", :action => "destroy" })

  #------------------------------

  # Routes for the Follower resource:

  # CREATE
  post("/insert_follower", { :controller => "followers", :action => "create" })
          
  # READ
  get("/followers", { :controller => "followers", :action => "index" })
  
  get("/followers/:path_id", { :controller => "followers", :action => "show" })
  
  # UPDATE
  
  post("/modify_follower/:path_id", { :controller => "followers", :action => "update" })
  
  # DELETE
  get("/delete_follower/:path_id", { :controller => "followers", :action => "destroy" })

  #------------------------------

  # Routes for the Playlist track resource:

  # CREATE
  post("/insert_playlist_track", { :controller => "playlist_tracks", :action => "create" })
          
  # READ
  get("/playlist_tracks", { :controller => "playlist_tracks", :action => "index" })
  
  get("/playlist_tracks/:path_id", { :controller => "playlist_tracks", :action => "show" })
  
  # UPDATE
  
  post("/modify_playlist_track/:path_id", { :controller => "playlist_tracks", :action => "update" })
  
  # DELETE
  get("/delete_playlist_track/:path_id", { :controller => "playlist_tracks", :action => "destroy" })

  #------------------------------

  # Routes for the Track resource:

  # CREATE
  post("/insert_track", { :controller => "tracks", :action => "create" })
          
  # READ
  get("/tracks", { :controller => "tracks", :action => "index" })
  
  get("/tracks/:path_id", { :controller => "tracks", :action => "show" })
  
  # UPDATE
  
  post("/modify_track/:path_id", { :controller => "tracks", :action => "update" })
  
  # DELETE
  get("/delete_track/:path_id", { :controller => "tracks", :action => "destroy" })

  #------------------------------

  # Routes for the Playlist resource:

  # CREATE
  post("/insert_playlist", { :controller => "playlists", :action => "create" })
          
  # READ
  get("/playlists", { :controller => "playlists", :action => "index" })
  
  get("/playlists/:path_id", { :controller => "playlists", :action => "show" })
  
  # UPDATE
  
  post("/modify_playlist/:path_id", { :controller => "playlists", :action => "update" })
  
  # DELETE
  get("/delete_playlist/:path_id", { :controller => "playlists", :action => "destroy" })

  #------------------------------

  devise_for :users

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
