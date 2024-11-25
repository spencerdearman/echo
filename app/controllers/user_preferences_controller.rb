class UserPreferencesController < ApplicationController
  def index
    matching_user_preferences = UserPreference.all

    @list_of_user_preferences = matching_user_preferences.order({ :created_at => :desc })

    render({ :template => "user_preferences/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_user_preferences = UserPreference.where({ :id => the_id })

    @the_user_preference = matching_user_preferences.at(0)

    render({ :template => "user_preferences/show" })
  end

  def create
    the_user_preference = UserPreference.new
    the_user_preference.user_id = params.fetch("query_user_id")
    the_user_preference.preference_key = params.fetch("query_preference_key")
    the_user_preference.preference_value = params.fetch("query_preference_value")

    if the_user_preference.valid?
      the_user_preference.save
      redirect_to("/user_preferences", { :notice => "User preference created successfully." })
    else
      redirect_to("/user_preferences", { :alert => the_user_preference.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_user_preference = UserPreference.where({ :id => the_id }).at(0)

    the_user_preference.user_id = params.fetch("query_user_id")
    the_user_preference.preference_key = params.fetch("query_preference_key")
    the_user_preference.preference_value = params.fetch("query_preference_value")

    if the_user_preference.valid?
      the_user_preference.save
      redirect_to("/user_preferences/#{the_user_preference.id}", { :notice => "User preference updated successfully."} )
    else
      redirect_to("/user_preferences/#{the_user_preference.id}", { :alert => the_user_preference.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_user_preference = UserPreference.where({ :id => the_id }).at(0)

    the_user_preference.destroy

    redirect_to("/user_preferences", { :notice => "User preference deleted successfully."} )
  end
end
