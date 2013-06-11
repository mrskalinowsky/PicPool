class WelcomeController < ApplicationController
  layout "welcome"
  def index
    render "index"
  end
end
