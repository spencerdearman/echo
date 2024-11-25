class FollowersController < ApplicationController
  def index
    matching_followers = Follower.all

    @list_of_followers = matching_followers.order({ :created_at => :desc })

    render({ :template => "followers/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_followers = Follower.where({ :id => the_id })

    @the_follower = matching_followers.at(0)

    render({ :template => "followers/show" })
  end

  def create
    the_follower = Follower.new
    the_follower.follower_id = params.fetch("query_follower_id")
    the_follower.followed_id = params.fetch("query_followed_id")

    if the_follower.valid?
      the_follower.save
      redirect_to("/followers", { :notice => "Follower created successfully." })
    else
      redirect_to("/followers", { :alert => the_follower.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_follower = Follower.where({ :id => the_id }).at(0)

    the_follower.follower_id = params.fetch("query_follower_id")
    the_follower.followed_id = params.fetch("query_followed_id")

    if the_follower.valid?
      the_follower.save
      redirect_to("/followers/#{the_follower.id}", { :notice => "Follower updated successfully."} )
    else
      redirect_to("/followers/#{the_follower.id}", { :alert => the_follower.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_follower = Follower.where({ :id => the_id }).at(0)

    the_follower.destroy

    redirect_to("/followers", { :notice => "Follower deleted successfully."} )
  end
end
