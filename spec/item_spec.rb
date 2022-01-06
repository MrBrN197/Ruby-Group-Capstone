require_relative '../classes/item'
require_relative '../classes/genre'
require_relative '../classes/label'
require_relative '../classes/author'


describe Item do
  context 'Tests for the item class' do
    item = Item.new(2020)
    item2 = Item.new(2010)
    label = Label.new('test_title', 'red')
    author = Author.new('George', 'Martin')
    genre = Genre.new('Test')

    it 'is an instance of class Item' do
      expect(item).to be_an_instance_of(Item)
    end

    it 'archive status changes based on the move_to_archive method' do
      item.move_to_archive
      item2.move_to_archive
      expect(item.archived).to be(false)
      expect(item2.archived).to be(true)
    end

    it 'correctly adds the genre' do
      item.add_genre(genre)
      expect(item.genre).to be(genre)
    end

    it 'correctly adds the label' do
      item.add_label(label)
      expect(item.label).to be(label)
    end

    it 'correctly adds the author' do
      item.add_author(author)
      expect(item.author).to be(author)
    end
  end
end
