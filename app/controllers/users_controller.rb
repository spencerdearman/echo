class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile_configuration
    @user = current_user
  end

  def update_profile
    @user = current_user
    if @user.update(user_params.merge(profile_completed: true))
      redirect_to root_path, notice: "Profile updated successfully!"
    else
      render :profile_configuration, alert: "Error updating profile."
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :bio, :profile_picture_url)
  end
end
