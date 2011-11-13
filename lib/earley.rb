require 'json'

module Earley
  extend self

  def check_string(grammar_file, string)
    json_file = File.read(grammar_file)
    data = JSON.parse(json_file, :symbolize_names => true)
  end

  def earley_algo(chart, grammar)
  end

  def predict(chart, grammar)
  end

  def scan(chart, grammar)
  end

  def complete(chart, grammar)
  end

end
