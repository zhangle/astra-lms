class Course < ActiveRecord::Base
  validates_presence_of :full_name, :short_name, :message => 'is required'
  validates_length_of :full_name, :minimum => 3, :message => 'must have at least %d characters'
  validates_length_of :full_name, :maximum => 100, :message => 'must have at most %d characters'
  validates_length_of :short_name, :minimum => 3, :message => 'must have at least %d characters'
  validates_length_of :short_name, :maximum => 10, :message => 'must have at most %d characters'
=begin
  validates_presence_of :description, :started_at, :finished_at, :max_students, :visible, :on => :update
  validates_length_of :description, :within => 10..300, :on => :update
  validates_numericality_of :max_students, :only_integer => true, :on => :update
=end
end
