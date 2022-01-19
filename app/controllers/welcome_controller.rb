class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    if current_user
      @profile = Profile.find(current_user.profile.id)
    end
    @images = Image.where(user_id: current_user)
  end
end
