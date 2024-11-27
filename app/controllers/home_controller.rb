class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def index
    # Redirect to profile configuration if the user's profile is incomplete
    if user_signed_in? && !current_user.profile_completed?
      redirect_to profile_configuration_path, alert: "Please complete your profile to continue."
    else
      render({ template: "home/home" })
    end
  end

  def dashboard
    # Accessible only to logged-in users with a completed profile
    render({ template: "home/dashboard" })
  end
end
