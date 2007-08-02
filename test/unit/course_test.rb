require File.dirname(__FILE__) + '/../test_helper'

class CourseTest < Test::Unit::TestCase
  fixtures :courses

  def test_updating_valid_course
    @course = courses(:first)
    @course.description = "A gentle introduction to the Ruby Prog. Lang."
    @course.started_at = Time.now
    @course.finished_at = Time.now + 3.months
    @course.max_students = 50
    @course.visible = true
    assert_equal true, @course.save
  end

  def test_too_short_fields
    @course = courses(:first)
    @course.full_name = "a"
    @course.short_name = "a"
    @course.description = "a"

    assert_equal false, @course.save
    assert_not_nil @course.errors["full_name"]
    assert_not_nil @course.errors["short_name"]
    assert_not_nil @course.errors["description"]
  end

end
