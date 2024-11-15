class PlaylistsController < ApplicationController
  def index
    matching_playlists = Playlist.all

    @list_of_playlists = matching_playlists.order({ :created_at => :desc })

    render({ :template => "playlists/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_playlists = Playlist.where({ :id => the_id })

    @the_playlist = matching_playlists.at(0)

    render({ :template => "playlists/show" })
  end

  def create
    the_playlist = Playlist.new
    the_playlist.user_id = params.fetch("query_user_id")
    the_playlist.name = params.fetch("query_name")
    the_playlist.description = params.fetch("query_description")
    the_playlist.is_public = params.fetch("query_is_public", false)
    the_playlist.playlist_cover_url = params.fetch("query_playlist_cover_url")
    the_playlist.is_ai_generated = params.fetch("query_is_ai_generated", false)
    the_playlist.playlist_tracks_count = params.fetch("query_playlist_tracks_count")
    the_playlist.likes_count = params.fetch("query_likes_count")

    if the_playlist.valid?
      the_playlist.save
      redirect_to("/playlists", { :notice => "Playlist created successfully." })
    else
      redirect_to("/playlists", { :alert => the_playlist.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_playlist = Playlist.where({ :id => the_id }).at(0)

    the_playlist.user_id = params.fetch("query_user_id")
    the_playlist.name = params.fetch("query_name")
    the_playlist.description = params.fetch("query_description")
    the_playlist.is_public = params.fetch("query_is_public", false)
    the_playlist.playlist_cover_url = params.fetch("query_playlist_cover_url")
    the_playlist.is_ai_generated = params.fetch("query_is_ai_generated", false)
    the_playlist.playlist_tracks_count = params.fetch("query_playlist_tracks_count")
    the_playlist.likes_count = params.fetch("query_likes_count")

    if the_playlist.valid?
      the_playlist.save
      redirect_to("/playlists/#{the_playlist.id}", { :notice => "Playlist updated successfully."} )
    else
      redirect_to("/playlists/#{the_playlist.id}", { :alert => the_playlist.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_playlist = Playlist.where({ :id => the_id }).at(0)

    the_playlist.destroy

    redirect_to("/playlists", { :notice => "Playlist deleted successfully."} )
  end
end
