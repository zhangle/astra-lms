class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column 'username', :string
      t.column 'crypted_password', :string
      t.column 'first_name', :string
      t.column 'last_name', :string
      t.column 'email', :string
      t.column 'description', :string
      t.column 'created_at', :datetime
      t.column 'updated_at', :datetime
    end
    admin = User.new do |u|
      u.username = 'admin'
      u.password = 'astra'
      u.first_name = 'Admin'
      u.last_name = 'User'
      u.email = 'admin@localhost.com'
      u.description = 'The system primary administrator.'
    end
    admin.save
  end

  def self.down
    drop_table :users
  end
end
