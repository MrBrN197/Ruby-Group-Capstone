require_relative '../classes/book'
require_relative './utils/input'
require_relative './utils/storage'
require 'json'

module BookFunctions
  include Input

  def list_all_books
    puts 'Books: '
    puts '---------------------------'
    if @book_list.empty?
      puts 'No Books to List'
    else
      @book_list.each_with_index do |book, i|
        puts "#{i + 1}) publisher: #{book.publisher}, cover state: #{book.cover_state},
        publish date: #{book.publish_date.year}"
      end
    end
    puts '---------------------------'
    puts ''
  end

  def list_all_labels
    puts 'Books: '
    puts '---------------------------'
    @label_list.each_with_index do |label, i|
      puts "#{i + 1}) title: #{label.title}, color: #{label.color}"
    end
    puts '---------------------------'
    puts ''
  end

  def ask_cover_state
    cover_state = ''
    valid = false
    until valid
      print 'Insert cover state[good/bad]:'
      cover_state = gets.chomp
      valid = %w[good bad].include?(cover_state)
      cover_state = '' unless valid
      puts 'Please insert good or bad as the cover state' unless valid
    end
    cover_state
  end

  def create_book(publisher, cover_state, publish_date)
    book = Book.new(publisher, cover_state, publish_date)
    @book_list.push(book)
  end

  def add_book
    publisher = ask_text('publisher')
    cover_state = ask_cover_state
    publish_date = ask_year('Publish Date').to_i
    create_book(publisher, cover_state, publish_date)
  end

  def save_books
    book_list = @book_list.map do |book|
      { 'publisher' => book.publisher, 'cover_state' => book.cover_state, 'publish_date' => book.publish_date }
    end
    JSONStorage.save('book_list', book_list)
  end

  def load_books
    raw_book_list = JSONStorage.load('book_list')
    return [] unless raw_book_list

    arr = []
    raw_book_list.each do |book|
      arr.push(Book.new(book['publisher'], book['cover_state'], book['publish_date'].to_i))
    end
    arr
  end
end
