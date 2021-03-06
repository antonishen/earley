require_relative "spot"

class Chart

  attr_accessor :columns

  def initialize(string)
    @columns = []
    @columns << { word: false, column: [], processed_rules: [] }
    string.split(/ /).each { |word| columns << { word: word, column: [], processed_rules: [] } }
  end

  def add_new_spot(column_number, rule_name, rules)
    additions = 0

    unless @columns[column_number][:processed_rules].index(rule_name)
      @columns[column_number][:processed_rules] << rule_name
      additions = rules.length

      rules.each do |rule|
        spot = Spot.new(column_number, rule_name, rule)
        @columns[column_number][:column] << spot
      end
    end

    additions
  end

  def add_existing_spot(column_number, spot, rule_to_consume)
    new_spot = spot.clone
    result = new_spot.consume_rule(rule_to_consume)
    @columns[column_number][:column] << new_spot if result

    result
  end

  def get_completions(column_number, rule_name)
    completions = []
    @columns[column_number][:column].each do |spot|
      unless spot.position == spot.rule_contents.length
        completions << spot if spot.rule_contents[spot.position].to_sym == rule_name
      end
    end

    completions
  end
end
