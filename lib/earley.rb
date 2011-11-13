require 'json'
require_relative 'earley/grammar'
require_relative 'earley/chart'


module Earley
  extend self

  def check_string(grammar_file, string)
    json_file = File.read(grammar_file)
    data = JSON.parse(json_file, :symbolize_names => true)

    grammar = Grammar.new(data)
    chart = Chart.new(string)
    chart.add_new_spot(0, :S, grammar.rules[:S])
    earley_algo(chart, grammar)

    result = false
    chart.columns[-1][:column].each do |spot|
      result = true if (spot.rule_name = :S && spot.complete)
    end

    result
  end

  def earley_algo(chart, grammar)
    chart.columns.each_with_index do |column, i|
      while(true)
        count = 0
        count += predict(chart, grammar, i)
        count += complete(chart, grammar, i) if i > 0
        break if count == 0
      end

      scan(chart, i) if i < (chart.columns.length - 1)
    end
  end

  def predict(chart, grammar, column_number)
    additions = 0
    column = chart.columns[column_number][:column]

    column.each do |spot|
      unless spot.complete
        rule_name = spot.rule_contents[spot.position].to_sym

        if grammar.rules[rule_name]
          additions += chart.add_new_spot(column_number, rule_name, grammar.rules[rule_name])
        end

      end
    end

    additions
  end

  def complete(chart, grammar, column_number)
    additions = 0
    column = chart.columns[column_number][:column]

    column.each do |spot|
      if spot.complete && !spot.dead
        spot.dead = true
        completions = chart.get_completions(spot.column, spot.rule_name)
        completions.each do |completion|
          chart.add_existing_spot(column_number, completion, spot.rule_name.to_s)
        end

        additions += completions.length
      end
    end

    additions
  end

  def scan(chart, column_number)
    column = chart.columns[column_number][:column]
    word = chart.columns[column_number + 1][:word]

    column.each do |spot|
        chart.add_existing_spot(column_number + 1, spot, word)
    end
  end

end
