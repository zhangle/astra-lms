require 'digest/sha1'
class User < ActiveRecord::Base
  attr_accessor :password

  validates_presence_of   :username, :first_name, :last_name, :email, :message => 'is required'
  validates_presence_of   :password, :if => :password_required?
  validates_length_of     :first_name, :last_name, :minimum => 2, :message => 'must have at least %d characters'
  validates_length_of     :first_name, :last_name, :maximum => 60, :message => 'must have at most %d characters'
  validates_length_of     :username, :minimum => 3,  :message => 'must have at least %d characters'
  validates_length_of     :username, :maximum => 20, :message => 'must have at most %d characters'
  validates_length_of     :password, :minimum => 5, :message => 'must have at least %d characters', :if => :password_required?
  validates_length_of     :password, :maximum => 40, :message => 'must have at most %d characters', :if => :password_required?
  validates_format_of     :email, :with => Format::EMAIL, :message => 'format is invalid'
  validates_uniqueness_of :username, :email, :case_sensitive => false, :message => 'has already been taken'

  before_save :encrypt_password

  def full_name
    "#{first_name} #{last_name}" # i18n will handle it better
  end

  protected
  def encrypt_password
    return if password.blank?
    self.crypted_password = Digest::SHA1.hexdigest(password)
  end

  def password_required?
    crypted_password.blank? || !password.blank?
  end
end
