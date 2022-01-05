require_relative '../classes/author'
require_relative '../classes/item'

describe Author do
  context 'Tests for the Author class' do
    it 'test that Author is correctly initialized' do
      author = Author.new('George', 'Martin')
      expect(author).to be_an_instance_of(Author)
    end

    it 'test that an author can add and item correctly' do
      item = Item.new(2010)
      author = Author.new('Suzanne', 'Collins')
      author.add_item(item)
      expect(author.items).to include(item)
      expect(item.author).to eql author
    end
  end
end
