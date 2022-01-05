class Author
  attr_reader :first_name, :last_name
  attr_accessor :items

  def initialize(first_name, last_name)
    @id = rand(1..100_000)
    @items = []
    @first_name = first_name
    @last_name = last_name
  end

  def add_item(item)
    item.add_author(self)
  end

  def to_s
    "#{@first_name} #{@last_name}"
  end
end
