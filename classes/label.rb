require_relative 'item'

class Label
  attr_reader :title, :color, :items, :id
  def initialize (title, color)
    @id = rand(1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_label(self)
  end
end
