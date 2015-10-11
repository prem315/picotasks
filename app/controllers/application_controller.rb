class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    protected
	  	def if_admin
	  		if user_signed_in? && !current_user.admin?
	  			flash[:danger] = "You have to be an admin"
	  			redirect_to new_user_session_path
	  		 
	  		end
	  	end
end
