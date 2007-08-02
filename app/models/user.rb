require 'digest/sha1'
class User < ActiveRecord::Base

  # Virtual attribute for the unencrypted password
  attr_accessor :password

  validates_presence_of   :login, :first_name, :last_name, :email
  validates_presence_of   :password,                     :if => :password_required?
  validates_format_of     :email, :with => Format::EMAIL
  validates_length_of     :login,      :within => 3..40
  validates_length_of     :password,   :within => 5..40, :if => :password_required?
  validates_length_of     :first_name, :within => 2..60
  validates_length_of     :last_name,  :within => 2..60
  validates_uniqueness_of :login, :email, :case_sensitive => false

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
