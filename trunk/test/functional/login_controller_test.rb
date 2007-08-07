require File.dirname(__FILE__) + '/../test_helper'
require 'login_controller'

# Re-raise errors caught by the controller.
class LoginController; def rescue_action(e) raise e end; end

class LoginControllerTest < Test::Unit::TestCase
  fixtures :users

  def setup
    @controller = LoginController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_index_without_user
    get :index
    assert_redirected_to :action => 'login'
    assert_equal 'Please log in', flash[:notice]
  end

  def test_login_with_invalid_user
    post :login, :user => {:username => 'bart', :password => 'bart2007'}
    assert_response :success
    assert_equal 'Invalid user/password combination', flash[:notice]
  end

  def test_login_with_valid_user
    post :login, :user => {:username => 'bart', :password => 'astra'} # stupid - you should be using the fixture
    assert_redirected_to :controller => 'home', :action => 'index'
    assert_not_nil session[:user_id]
    user = User.find(session[:user_id])
    assert_equal 'bart', user.username
  end

  def test_logout
    post :login, :user => {:username => 'bart', :password => 'astra'} # stupid - you should be using the fixture
    assert_redirected_to :controller => 'home', :action => 'index'
    assert_not_nil session[:user_id]
    get :logout
    assert session[:user_id].nil?
    assert_redirected_to :controller => 'home', :action => 'index'
    assert_equal 'You are now logged out', flash[:notice]
  end
end
