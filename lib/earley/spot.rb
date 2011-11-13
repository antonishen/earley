class Spot

  attr_reader :column, :rule, :position

  def initialize(column, rule_name, rule_contents)
    @column = column
    @rule = { rule_name: rule_contents }
    @position = 0
  end
end