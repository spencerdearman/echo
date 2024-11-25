class MoodsController < ApplicationController
  def index
    matching_moods = Mood.all

    @list_of_moods = matching_moods.order({ :created_at => :desc })

    render({ :template => "moods/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_moods = Mood.where({ :id => the_id })

    @the_mood = matching_moods.at(0)

    render({ :template => "moods/show" })
  end

  def create
    the_mood = Mood.new
    the_mood.name = params.fetch("query_name")

    if the_mood.valid?
      the_mood.save
      redirect_to("/moods", { :notice => "Mood created successfully." })
    else
      redirect_to("/moods", { :alert => the_mood.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_mood = Mood.where({ :id => the_id }).at(0)

    the_mood.name = params.fetch("query_name")

    if the_mood.valid?
      the_mood.save
      redirect_to("/moods/#{the_mood.id}", { :notice => "Mood updated successfully."} )
    else
      redirect_to("/moods/#{the_mood.id}", { :alert => the_mood.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_mood = Mood.where({ :id => the_id }).at(0)

    the_mood.destroy

    redirect_to("/moods", { :notice => "Mood deleted successfully."} )
  end
end
