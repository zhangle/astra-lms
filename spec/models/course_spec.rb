require File.dirname(__FILE__) + '/../spec_helper'

module CourseSpecHelper
  def self.create_course(options={})
    Course.create({:full_name => 'BDD with RSpec',
                   :short_name => 'SE101',
                   :description => 'How to use RSpec to test your projects',
                   :started_at => Time.now,
                   :finished_at => Time.now + 3.months,
                   :max_students => 50,
                   :visible => true}.merge(options))
  end
end

describe Course, 'without a full name' do
  before(:each) do
    @course = CourseSpecHelper.create_course(:full_name => nil)
  end

  it "should NOT be valid" do
    @course.should_not be_valid
  end

  it 'should have an error message associated with the full name' do
    @course.valid?
    @course.errors.on(:full_name).should include('is required')
  end
end

describe Course, 'without a short name' do
  before(:each) do
    @course = CourseSpecHelper.create_course(:short_name => nil)
  end

  it "should NOT be valid" do
    @course.should_not be_valid
  end

  it 'should have an error message associated with the short name' do
    @course.valid?
    @course.errors.on(:short_name).should include('is required')
  end
end

describe Course, 'with a full name shorter than 3 characters' do
  before(:each) do
    @course = CourseSpecHelper.create_course(:full_name => 'AB')
  end

  it "should NOT be valid" do
    @course.should_not be_valid
  end

  it 'should have an error message associated with the full name' do
    @course.valid?
    @course.errors.on(:full_name).should include('must have at least 3 characters')
  end
end

describe Course, 'with a full name longer than 100 characters' do
  before(:each) do
    @course = CourseSpecHelper.create_course(:full_name => 'A'*101)
  end

  it "should NOT be valid" do
    @course.should_not be_valid
  end

  it 'should have an error message associated with the full name' do
    @course.valid?
    @course.errors.on(:full_name).should include('must have at most 100 characters')
  end
end

describe Course, 'with a short name shorter than 3 characters' do
  before(:each) do
    @course = CourseSpecHelper.create_course(:short_name => 'AB')
  end

  it "should NOT be valid" do
    @course.should_not be_valid
  end

  it 'should have an error message associated with the short name' do
    @course.valid?
    @course.errors.on(:short_name).should include('must have at least 3 characters')
  end
end

=begin
describe Course, 'with a description shorter than 10 characters' do
  before(:each) do
    @course = CourseSpecHelper.create_course(:description => 'A'*9)
  end

  it "should NOT be valid" do
    @course.should_not be_valid
  end

  it 'should have an error message associated with the description' do
    @course.valid?
    @course.errors.on(:description).should include('must have at least 10 characters')
  end
end
=end
