require_relative '../classes/genre'
require_relative '../classes/item'

describe Genre do
  context 'Tests for the genre class' do
    item = Item.new(2010)
    genre = Genre.new('test_name')

    it 'is an instance of class Item' do
      expect(genre).to be_an_instance_of(Genre)
    end

    it 'can add an item, also adding the genre to the item' do
      genre.add_item(item)
      expect(genre.items).to include(item)
      expect(item.genre).to eq(genre)
    end
  end
end
