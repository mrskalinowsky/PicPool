class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_in_path_for(resource_or_scope)
     user_pools_path(resource_or_scope)
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

end
