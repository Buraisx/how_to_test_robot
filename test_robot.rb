require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # arrange
    robot = Robot.new
    # act
    robot.needs_repairs = true
    robot.foreign_model = true
    expect = 1
    actual = robot.station
    # assert
    assert_equal(expect,actual)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
    robot = Robot.new
    robot.needs_repairs = true
    robot.vintage_model = true
    # act
    expect = 2
    actual = robot.station
    # assert
    assert_equal(expect,actual)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
    robot = Robot.new
    robot.needs_repairs = true
    # act
    expect = 3
    actual = robot.station
    # assert
    assert_equal(expect,actual)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange
    robot = Robot.new
    # act
    expect = 4
    actual = robot.station
    # assert
    assert_equal(expect,actual)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
    robot = Robot.new
    # act
    expect = -1
    actual = robot.prioritize_tasks
    # assert
    assert_equal(expect,actual)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    robot = Robot.new
    # act
    robot.todos = [1,2,3,4]
    expect = robot.todos.max
    actual = robot.prioritize_tasks
    # assert
    assert_equal(expect,actual)
  end

  def test_workday_on_day_off_returns_false
    # arrange
    robot = Robot.new
    robot.day_off = "sunday"
    # act
    expect = false
    actual = robot.workday?("sunday")
    # assert
    assert_equal(expect,actual)
  end

  def test_workday_not_day_off_returns_true
    # arrange
    robot = Robot.new
    robot.day_off = "tuesday"
    # act
    expect = true
    actual = robot.workday?("sunday")
    # assert
    assert_equal(expect,actual)
  end

end
