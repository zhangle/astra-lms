class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.column 'full_name',    :string,   :null => false, :limit => 100
      t.column 'short_name',   :string,   :null => false, :limit => 10
      t.column 'description',  :text,     :null => false
      t.column 'started_at',   :datetime, :null => false
      t.column 'finished_at',  :datetime, :null => false
      t.column 'max_students', :integer,  :null => false, :limit => 3
      t.column 'visible',      :boolean,  :null => false, :default => true
    end
  end

  def self.down
    drop_table :courses
  end
end
