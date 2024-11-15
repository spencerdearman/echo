class PlaylistTracksController < ApplicationController
  def index
    matching_playlist_tracks = PlaylistTrack.all

    @list_of_playlist_tracks = matching_playlist_tracks.order({ :created_at => :desc })

    render({ :template => "playlist_tracks/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_playlist_tracks = PlaylistTrack.where({ :id => the_id })

    @the_playlist_track = matching_playlist_tracks.at(0)

    render({ :template => "playlist_tracks/show" })
  end

  def create
    the_playlist_track = PlaylistTrack.new
    the_playlist_track.playlist_id = params.fetch("query_playlist_id")
    the_playlist_track.track_id = params.fetch("query_track_id")
    the_playlist_track.position = params.fetch("query_position")

    if the_playlist_track.valid?
      the_playlist_track.save
      redirect_to("/playlist_tracks", { :notice => "Playlist track created successfully." })
    else
      redirect_to("/playlist_tracks", { :alert => the_playlist_track.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_playlist_track = PlaylistTrack.where({ :id => the_id }).at(0)

    the_playlist_track.playlist_id = params.fetch("query_playlist_id")
    the_playlist_track.track_id = params.fetch("query_track_id")
    the_playlist_track.position = params.fetch("query_position")

    if the_playlist_track.valid?
      the_playlist_track.save
      redirect_to("/playlist_tracks/#{the_playlist_track.id}", { :notice => "Playlist track updated successfully."} )
    else
      redirect_to("/playlist_tracks/#{the_playlist_track.id}", { :alert => the_playlist_track.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_playlist_track = PlaylistTrack.where({ :id => the_id }).at(0)

    the_playlist_track.destroy

    redirect_to("/playlist_tracks", { :notice => "Playlist track deleted successfully."} )
  end
end
