class TrackMoodsController < ApplicationController
  def index
    matching_track_moods = TrackMood.all

    @list_of_track_moods = matching_track_moods.order({ :created_at => :desc })

    render({ :template => "track_moods/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_track_moods = TrackMood.where({ :id => the_id })

    @the_track_mood = matching_track_moods.at(0)

    render({ :template => "track_moods/show" })
  end

  def create
    the_track_mood = TrackMood.new
    the_track_mood.track_id = params.fetch("query_track_id")
    the_track_mood.mood_id = params.fetch("query_mood_id")

    if the_track_mood.valid?
      the_track_mood.save
      redirect_to("/track_moods", { :notice => "Track mood created successfully." })
    else
      redirect_to("/track_moods", { :alert => the_track_mood.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_track_mood = TrackMood.where({ :id => the_id }).at(0)

    the_track_mood.track_id = params.fetch("query_track_id")
    the_track_mood.mood_id = params.fetch("query_mood_id")

    if the_track_mood.valid?
      the_track_mood.save
      redirect_to("/track_moods/#{the_track_mood.id}", { :notice => "Track mood updated successfully."} )
    else
      redirect_to("/track_moods/#{the_track_mood.id}", { :alert => the_track_mood.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_track_mood = TrackMood.where({ :id => the_id }).at(0)

    the_track_mood.destroy

    redirect_to("/track_moods", { :notice => "Track mood deleted successfully."} )
  end
end
