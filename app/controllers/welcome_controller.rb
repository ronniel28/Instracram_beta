class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @images = Image.where(user_id: current_user)
  end
end
