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
    earley_algo(chart, grammar)
  end

  def earley_algo(chart, grammar)
    chart.columns.each_with_index do |column, i|

    end
  end

  def predict(chart, grammar, column_number)
  end

  def scan(chart, grammar, column_number)
  end

  def complete(chart, grammar, column_number)
  end

end
