class Grammar
  attr_reader :terminals, :rules

  def initialize(raw_grammar)
    @rules = raw_grammar[:rules]
    @terminals = raw_grammar[:terminals]
  end
end