class Chart

  attr_accessor :columns

  def initialize(string)
    @columns = []

    string.split(/ /).each { |word| columns << { word: word, column: [] } }
  end
end