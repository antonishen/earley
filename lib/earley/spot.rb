class Spot

  attr_reader :column, :rule_name, :rule_contents, :position, :complete

  def initialize(column, rule_name, rule_contents)
    @column = column
    @rule_name = rule_name
    @rule_contents = rule_contents
    @position = 0
    @complete = false
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

  def consume_rule(rule)
    result = false

    unless @complete
      if rule_contents[position] == rule
        @position += 1
        @complete = true if position == rule_contents.length
        result = true
      end
    end

    return result
  end
end
