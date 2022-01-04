require 'math'

class Author
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @id = rand(1..100_000)
    @items = []
    @first_name = first_name
    @last_name = last_name
  end

  def add_item(item)
    items.push(item) unless @items.include? item
  end
end
