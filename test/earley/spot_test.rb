require 'minitest/autorun'
require_relative '../../lib/earley/spot'

class SpotTest < MiniTest::Unit::TestCase
  def setup
    @spot = Spot.new(0, :NP, ["ProperNoun", "test"])
  end

  def test_consume_rule_position_increments
    @spot.consume_rule("ProperNoun")
    assert_equal 1, @spot.position
  end

  def test_consume_rule_completes
    @spot.consume_rule("ProperNoun")
    assert_equal false, @spot.complete

    @spot.consume_rule("test")
    assert_equal true, @spot.complete
  end

  def test_consume_rule_fails
    assert_equal false, @spot.consume_rule("fake")
  end
end