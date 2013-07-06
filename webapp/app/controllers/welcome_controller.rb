class WelcomeController < ApplicationController
  layout "welcome"
  def index
    if user_signed_in?
      redirect_to user_pools_path(current_user)
    else
      render "index"
    end
  end
end
