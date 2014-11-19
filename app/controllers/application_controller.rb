class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  alias_method :current_user, :current_customer

  private

    # Confirms a logged-in user.
    def logged_in_customer
      unless customer_signed_in?
        flash[:alert] = "Please log in."
        redirect_to new_customer_session_path
      end
    end
end
