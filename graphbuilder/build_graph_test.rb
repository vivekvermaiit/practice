require 'test/unit'
require_relative 'graphbuilder/b'

class MyTest < Test::Unit::TestCase

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
  def test_works
    x=BuildGraph.new
    x.build_graph([[:a,:d],[:f,:b],[:b,:d],[:f,:a],[:d,:c]],[:a,:b,:c,:d,:e,:f])
    x.build_order

    assert_equal(x.built_labels,[:f, :b, :e, :a, :d, :c])
  end
end