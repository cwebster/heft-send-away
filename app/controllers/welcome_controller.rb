class WelcomeController < ApplicationController
  def index
    if current_user.nil?
      ## Add something for the normal user
      render layout: "no_left_side_bar"
    else
      redirect_to laboratory_path(current_user.laboratories.first)
      # render layout: "application"
    end
  end
end
