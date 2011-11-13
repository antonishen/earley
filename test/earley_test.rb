require 'minitest/autorun'
require_relative '../lib/earley'

class EarleyTest < MiniTest::Unit::TestCase
  def setup
    if File.exists?("./files/grammar1.json")
      @grammar_file = "./files/grammar1.json"
    else
      @grammar_file = "../files/grammar1.json"
    end
  end

  def test_check_string
    assert_equal true, Earley.check_string(@grammar_file, "Jen saw Bill through the window")
  end
end