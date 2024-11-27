class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def index
    # Publicly accessible
    render({ :template => "home/home"})
  end

  def dashboard
    # Only accessible to logged-in users
  end
end
