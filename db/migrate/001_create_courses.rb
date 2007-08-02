class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.column 'full_name',    :string,   :null => false, :limit => 100
      t.column 'short_name',   :string,   :null => false, :limit => 10
      t.column 'description',  :text
      t.column 'started_at',   :datetime
      t.column 'finished_at',  :datetime
      t.column 'max_students', :integer
      t.column 'visible',      :boolean,  :null => false, :default => false
    end
  end

  def self.down
    drop_table :courses
  end
end
