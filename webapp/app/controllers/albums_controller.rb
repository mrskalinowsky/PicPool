class AlbumsController < ApplicationController
  
  before_filter do
    authenticate_user! rescue redirect_to welcome_url
  end
  
  def home
  end
end
