require File.dirname(__FILE__) + '/../test_helper'
require 'home_controller'

# Re-raise errors caught by the controller.
class HomeController; def rescue_action(e) raise e end; end

class HomeControllerTest < Test::Unit::TestCase
  def setup
    @controller = HomeController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_show_login_info_for_unauthenticated_user
    get :index
    assert_tag :tag => 'ul', :attributes => {:id => 'tool_bar'}, :descendant => {:tag => 'li', :attributes => {:id => 'login_info'}}
  end

  def test_should_show_login_info_for_authenticated_user
    login
    get :index
    assert_tag :tag => 'ul', :attributes => {:id => 'tool_bar'}, :descendant => {:tag => 'li', :attributes => {:id => 'login_info'}}
  end

  def test_should_show_log_in_link_to_unauthenticated_user
    get :index
    assert_tag :tag => 'ul', :attributes => {:id => 'tool_bar'}, :descendant => {:tag => 'li', :attributes => {:id => 'login_or_logout'}}
  end

  def test_should_show_log_out_link_to_authenticated_user
    login
    get :index
    assert_tag :tag => 'ul', :attributes => {:id => 'tool_bar'}, :descendant => {:tag => 'li', :attributes => {:id => 'login_or_logout'}}
  end
end
