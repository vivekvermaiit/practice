require 'test/unit'
require_relative "hello_world"

class MyTestHelloWorld < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test
  def test_fail
    x=HelloWorld.new
    assert_boolean(TRUE)
  end
end