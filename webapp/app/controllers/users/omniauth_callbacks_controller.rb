class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook

    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    if @user.persisted?
      #debugger
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      #redirect_to user_pools_path(@user), :event => :authentication
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      #debugger
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
