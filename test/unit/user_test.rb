require File.dirname(__FILE__) + '/../test_helper'

class UserTest < Test::Unit::TestCase
=begin
  fixtures :users

  def test_should_create_user
    assert create_user.valid?
  end

  def test_should_require_login
    u = create_user(:login => nil)
    assert u.errors.on(:login)
  end

  def test_should_require_password
    u = create_user(:password => nil)
    assert u.errors.on(:password)
  end

  def test_should_require_first_name
    u = create_user(:first_name => nil)
    assert u.errors.on(:first_name)
  end

  def test_should_require_last_name
    u = create_user(:last_name => nil)
    assert u.errors.on(:last_name)
  end

  def test_should_require_email
    u = create_user(:email => nil)
    assert u.errors.on(:email)
  end

  protected
    def create_user(options = {})
      User.create({:login => 'claire',
                   :password => 'claire',
                   :first_name => 'Claire',
                   :last_name => 'Bennet',
                   :email => 'claire@example.com'}.merge(options))
    end
=end
end
