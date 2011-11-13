class Spot

  attr_reader :column, :rule_name, :rule_contents, :position

  def initialize(column, rule_name, rule_contents)
    @column = column
    @rule_name = rule_name
    @rule_contents = rule_contents
    @position = 0
  end

  def ==(other)
    if (@column == other.column &&
       @rule_name == other.rule_name &&
       @rule_contents == other.rule_contents &&
       @position == other.position)
        return true
    else
      return false
    end
  end
end