class Course < ActiveRecord::Base
  validates_presence_of :full_name, :short_name
  validates_presence_of :description, :started_at, :finished_at, :max_students, :visible, :on => :update
  validates_length_of :full_name, :within => 3..100
  validates_length_of :short_name, :within => 3..10
  validates_length_of :description, :within => 10..300, :on => :update
  validates_numericality_of :max_students, :only_integer => true, :on => :update
end
