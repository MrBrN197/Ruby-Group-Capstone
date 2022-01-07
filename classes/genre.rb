class Genre
  attr_accessor :archived, :items, :name

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_genre(self)
  end

  def to_s
    %(Name: "#{@name}")
  end

  def to_json(json)
    json.generate({ name: @name })
  end
end
