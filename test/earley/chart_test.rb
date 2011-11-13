require 'minitest/autorun'
require_relative '../../lib/earley/chart'

class ChartTest < MiniTest::Unit::TestCase
  def setup
    @chart = Chart.new("one two three")
  end

  def test_initialize_new_chart
    result = [{ :word=>"one", :column=>[] },
              { :word=>"two", :column=>[] },
              { :word=>"three", :column=>[] }]
    assert_equal result, @chart.columns
  end
end