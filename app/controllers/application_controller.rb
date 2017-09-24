class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    # The same method we used before
    # Available for use across all controllers
    def authenticate_user!
      if user_signed_in? != true
        redirect_to new_session_path
      end
    end

    # method defined for controller to user
    # it will check if the current_user is present
    def user_signed_in?
      session[:user_id].present?
    end

end
