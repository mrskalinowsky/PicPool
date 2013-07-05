class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource_or_scope)
    #debugger
    user_pools_path(resource_or_scope)
    #albums_home_path
  end
  
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
