# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def login_info
    if session[:user_id]
      "You are logged in as #{session[:user_id].full_name}"
    else
      "You are not logged in"
    end
  end

  def login_or_logout
    if session[:user_id]
      link_to 'Logout', :controller => 'login', :action => 'logout'
    else
      link_to 'Login', :controller => 'login', :action => 'login'
    end
  end
end
