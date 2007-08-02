class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column 'login',            :string,   :null => false, :limit => 40
      t.column 'crypted_password', :string,   :null => false, :limit => 40
      t.column 'first_name',       :string,   :null => false, :within => 2..60
      t.column 'last_name',        :string,   :null => false, :within => 2..60
      t.column 'email',            :string,   :null => false, :limit => 100
      t.column 'created_at',       :datetime, :null => false
      t.column 'updated_at',       :datetime, :null => false
    end
  end

  def self.down
    drop_table :users
  end
end
