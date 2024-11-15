class TracksController < ApplicationController
  def index
    matching_tracks = Track.all

    @list_of_tracks = matching_tracks.order({ :created_at => :desc })

    render({ :template => "tracks/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_tracks = Track.where({ :id => the_id })

    @the_track = matching_tracks.at(0)

    render({ :template => "tracks/show" })
  end

  def create
    the_track = Track.new
    the_track.title = params.fetch("query_title")
    the_track.artist_id = params.fetch("query_artist_id")
    the_track.album_name = params.fetch("query_album_name")
    the_track.platform_id = params.fetch("query_platform_id")
    the_track.duration_ms = params.fetch("query_duration_ms")

    if the_track.valid?
      the_track.save
      redirect_to("/tracks", { :notice => "Track created successfully." })
    else
      redirect_to("/tracks", { :alert => the_track.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_track = Track.where({ :id => the_id }).at(0)

    the_track.title = params.fetch("query_title")
    the_track.artist_id = params.fetch("query_artist_id")
    the_track.album_name = params.fetch("query_album_name")
    the_track.platform_id = params.fetch("query_platform_id")
    the_track.duration_ms = params.fetch("query_duration_ms")

    if the_track.valid?
      the_track.save
      redirect_to("/tracks/#{the_track.id}", { :notice => "Track updated successfully."} )
    else
      redirect_to("/tracks/#{the_track.id}", { :alert => the_track.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_track = Track.where({ :id => the_id }).at(0)

    the_track.destroy

    redirect_to("/tracks", { :notice => "Track deleted successfully."} )
  end
end
