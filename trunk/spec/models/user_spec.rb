require File.dirname(__FILE__) + '/../spec_helper'

module UserSpecHelper
  def self.create_user(options={})
    User.create({:username => 'peter',
                 :password => 'peter',
                 :crypted_password => nil,
                 :first_name => 'Peter',
                 :last_name => 'Petrelli',
                 :email => 'peter@example.com',
                 :description => 'A nurse with special habilities'}.merge(options))
  end
end

describe User, 'without a username' do
  before(:each) do
    @user = UserSpecHelper.create_user(:username => nil)
  end

  it 'should NOT be valid' do
    @user.should_not be_valid
  end

  it 'should have an error message associated with the username' do
    @user.valid?
    @user.errors.on(:username).should include('is required')
  end
end

describe User, 'with a username shorter than 3 characters' do
  before(:each) do
    @user = UserSpecHelper.create_user(:username => 'al')
  end

  it 'should NOT be valid' do
    @user.should_not be_valid
  end

  it 'should have an error message associated with the username' do
    @user.valid?
    @user.errors.on(:username).should eql('must have at least 3 characters')
  end
end

describe User, 'with a username of 5 charactes' do
  it 'should NOT have any error messages associated with the username' do
    @user = UserSpecHelper.create_user(:username => 'peter')
    @user.valid?
    @user.errors.on(:username).should be_nil
  end
end

describe User, 'with a username longer than 20 characters' do
  before(:each) do
    @user = UserSpecHelper.create_user(:username => 'a' * 21)
  end

  it 'should NOT be valid' do
    @user.should_not be_valid
  end

  it 'should have an error message associated with the username' do
    @user.valid?
    @user.errors.on(:username).should eql('must have at most 20 characters')
  end
end

describe User, 'with an already taken username' do
  before(:each) do
    @peter_parker = UserSpecHelper.create_user(:username => 'peter', :email => 'parker@example.com')
    @peter_petrelli = UserSpecHelper.create_user(:username => 'peter', :email => 'petrelli@example.com')
    @peter_smith = UserSpecHelper.create_user(:username => 'PETER', :email => 'smith@example.com')
    @peter_parker.save
  end

  it 'should NOT be valid when they have both the same case' do
    @peter_petrelli.should_not be_valid
  end

  it 'should NOT be valid even when they have different cases' do
    @peter_smith.should_not be_valid
  end

  it 'should have an error message associated with the username when they have both the same case' do
    @peter_petrelli.valid?
    @peter_petrelli.errors.on(:username).should eql('has already been taken')
  end

  it 'should have an error message associated with the username even when they have different cases' do
    @peter_smith.valid?
    @peter_smith.errors.on(:username).should eql('has already been taken')
  end
end

describe User, 'without a first name' do
  before(:each) do
    @user = UserSpecHelper.create_user(:first_name => nil)
  end

  it 'should NOT be valid' do
    @user.should_not be_valid
  end

  it 'should have an error message associated with the first name' do
    @user.valid?
    @user.errors.on(:first_name).should include('is required')
  end
end

describe User, 'with a first name shorter than 2 characters' do
  before(:each) do
    @user = UserSpecHelper.create_user(:first_name => 'P')
  end

  it 'should NOT be valid' do
    @user.should_not be_valid
  end

  it 'should have an error message associated with the first name' do
    @user.valid?
    @user.errors.on(:first_name).should eql('must have at least 2 characters')
  end
end

describe User, 'with a first name of 5 characters' do
  it 'should NOT have any messages associated with the first name' do
    @user = UserSpecHelper.create_user(:first_name => 'Peter')
    @user.valid?
    @user.errors.on(:first_name).should be_nil
  end
end

describe User, 'with a first name longer than 60 characters' do
  before(:each) do
    @user = UserSpecHelper.create_user(:first_name => 'P' * 61)
  end

  it 'should NOT be valid' do
    @user.should_not be_valid
  end

  it 'should have an error message associated with the first name' do
    @user.valid?
    @user.errors.on(:first_name).should eql('must have at most 60 characters')
  end
end

describe User, 'without a last name' do
  before(:each) do
    @user = UserSpecHelper.create_user(:last_name => nil)
  end

  it 'should NOT be valid' do
    @user.should_not be_valid
  end

  it 'should have an error message associated with the last name' do
    @user.valid?
    @user.errors.on(:last_name).should include('is required')
  end
end

describe User, 'with a last name shorter than 2 characters' do
  before(:each) do
    @user = UserSpecHelper.create_user(:last_name => 'P')
  end

  it 'should NOT be valid' do
    @user.should_not be_valid
  end

  it 'should have an error message associated with the last name' do
    @user.valid?
    @user.errors.on(:last_name).should eql('must have at least 2 characters')
  end
end

describe User, 'with a last name of 8 characters' do
  it 'should NOT have any error messages associated with the last name' do
    @user = UserSpecHelper.create_user(:last_name => 'Petrelli')
    @user.valid?
    @user.errors.on(:last_name).should be_nil
  end
end

describe User, 'with a last name longer than 60 characters' do
  before(:each) do
    @user = UserSpecHelper.create_user(:last_name => 'P' * 61)
  end

  it 'should NOT be valid' do
    @user.should_not be_valid
  end

  it 'should have an error message associated with the last name' do
    @user.valid?
    @user.errors.on(:last_name).should eql('must have at most 60 characters')
  end
end

describe User, 'without an email' do
  before(:each) do
    @user = UserSpecHelper.create_user(:email => nil)
  end

  it 'should NOT be valid' do
    @user.should_not be_valid
  end

  it 'should have an error message associated with the email' do
    @user.valid?
    @user.errors.on(:email).should include('is required')
  end
end

describe User, 'with an email like caio@example.com' do
  it 'should NOT have any error messages associated with the email' do
    @user = UserSpecHelper.create_user(:email => 'caio@example.com')
    @user.valid?
    @user.errors.on(:email).should be_nil
  end
end

describe User, 'with a bad email address' do
  it 'should have an error message associated with the email' do
    @user = UserSpecHelper.create_user(:email => 'example.com')
    @user.valid?
    @user.errors.on(:email).should eql('format is invalid')
  end
end

describe User, 'with an already taken email' do
  before(:each) do
    @peter_parker = UserSpecHelper.create_user(:username => 'pparker', :email => 'peter@example.com')
    @peter_petrelli = UserSpecHelper.create_user(:username => 'ppetrelli', :email => 'peter@example.com')
    @peter_smith = UserSpecHelper.create_user(:username => 'psmith', :email => 'PETER@example.com')
    @peter_parker.save
  end

  it 'should NOT be valid when they have both the same case' do
    @peter_petrelli.should_not be_valid
  end

  it 'should NOT be valid even when they have different cases' do
    @peter_smith.should_not be_valid
  end

  it 'should have an error message associated with the username when they have both the same case' do
    @peter_petrelli.valid?
    @peter_petrelli.errors.on(:email).should eql('has already been taken')
  end

  it 'should have an error message associated with the username even when they have different cases' do
    @peter_smith.valid?
    @peter_smith.errors.on(:email).should eql('has already been taken')
  end
end

describe User, 'with a password but without a crypted password' do
  before(:each) do
    @user = UserSpecHelper.create_user(:crypted_password => nil)
  end

  it 'should be valid' do
    @user.should be_valid
  end
end

describe User, 'without a password but with a crypted password' do
  before(:each) do
    @user = UserSpecHelper.create_user(:password => nil, :crypted_password => 'something_really_secret')
  end

  it 'should be valid' do
    @user.should be_valid
  end
end

describe User, 'with a password shorter than 5 characters' do
  before(:each) do
    @user = UserSpecHelper.create_user(:password => 'abcd', :crypted_password => nil)
  end

  it 'should not be valid' do
    @user.should_not be_valid
  end

  it 'should have an error message associated with the password' do
    @user.errors.on(:password).should eql('must have at least 5 characters')
  end
end

describe User, 'with a password longer than 40 characters' do
  before(:each) do
    @user = UserSpecHelper.create_user(:password => 'a' * 41, :crypted_password => nil)
  end

  it 'should not be valid' do
    @user.should_not be_valid
  end

  it 'should have an error message associated with the password' do
    @user.errors.on(:password).should eql('must have at most 40 characters')
  end
end

describe User, 'with a valid password' do

  it 'should have his os hers password crypted before being updated' do
    @user = UserSpecHelper.create_user
    @user.save
    @user.crypted_password.should eql('4b8373d016f277527198385ba72fda0feb5da015')
  end

end

describe User, 'with valid both first name and last name' do

  it 'should have an also valid full name' do
    @user = UserSpecHelper.create_user
    @user.full_name.should eql('Peter Petrelli') 
  end

end
