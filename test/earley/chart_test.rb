require 'minitest/autorun'
require_relative '../../lib/earley/chart'

class ChartTest < MiniTest::Unit::TestCase
  def setup
    @chart = Chart.new("one two three")
  end

  def test_initialize_new_chart
    result = [{ :word=>"one", :column=>[], :processed_rules=>[] },
              { :word=>"two", :column=>[], :processed_rules=>[] },
              { :word=>"three", :column=>[], :processed_rules=>[] }]
    assert_equal result, @chart.columns
  end

  def test_add_new_spot
    spot_one = Spot.new(0, :NP, ["ProperNoun"])
    spot_two = Spot.new(0, :NP, ["Det", "N"])
    @chart.add_new_spot(0, :NP, [["ProperNoun"], ["Det", "N"]])

    assert_equal spot_one, @chart.columns[0][:column][0]
    assert_equal spot_two, @chart.columns[0][:column][1]
  end

  def test_add_existing_spot_success
    spot_one = Spot.new(0, :NP, ["ProperNoun"])
    @chart.add_existing_spot(1, spot_one, "ProperNoun")

    assert_equal spot_one, @chart.columns[1][:column][0]
  end

  def test_add_existing_spot_failure
    spot_one = Spot.new(0, :NP, ["ProperNoun"])
    @chart.add_existing_spot(1, spot_one, "test")

    assert_equal nil, @chart.columns[1][:column][0]
  end
end
