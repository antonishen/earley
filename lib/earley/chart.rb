require_relative "spot"

class Chart

  attr_accessor :columns

  def initialize(string)
    @columns = []

    string.split(/ /).each { |word| columns << { word: word, column: [] } }
  end

  def add_new_spot(rule_name, rules, column_number)
    rules.each do |rule|
      spot = Spot.new(column_number, rule_name, rule)
      @columns[column_number][:column] << spot
    end
  end
end