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
  end

  def self.down
    drop_table :users
  end
end
