# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_astra_session_id'

  def authorize
    unless session[:user_id]
      flash[:notice] = 'Please log in'
      redirect_to :controller => 'login', :action => 'login'
    end
  end
end
