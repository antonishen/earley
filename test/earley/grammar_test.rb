#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative '../../lib/earley/grammar'

class GrammarTest < MiniTest::Unit::TestCase
  def setup
    @raw_grammar = {
                      rules: {
                        Det: [["the"]],
                        N: [["window"]],
                        NP: [["ProperNoun"], ["Det", "N"]],
                        PP: [["Prep", "NP"]],
                        Prep: [["through"]],
                        ProperNoun: [["Jen"], ["Bill"]],
                        S: [["NP", "VP"]], :V=>[["saw"]],
                        VP: [["V", "NP"], ["VP", "PP"]]
                      },
                      terminals: ["Jen", "Bill", "saw", "through", "the", "window"]
                   }
  end

  def test_initialize_new_grammar
    grammar = Grammar.new(@raw_grammar)
    assert_equal @raw_grammar[:rules], grammar.rules
    assert_equal @raw_grammar[:terminals], grammar.terminals
  end
end