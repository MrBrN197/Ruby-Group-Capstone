require_relative '../classes/book'
require 'json'

module BookFunctions
  def list_all_books
    @book_list.each_with_index do |book, i|
      puts "#{i + 1}) publisher: #{book.publisher}, cover state: #{book.cover_state},
      publish date: #{book.publish_date.year}"
    end
  end

  def list_all_labels
    @label_list.each_with_index do |label, i|
      puts "#{i + 1}) title: #{label.title}, color: #{label.color}"
    end
  end

  def ask_text(text)
    valid = false
    until valid
      print "Insert #{text}:"
      input = gets.chomp
      valid = true unless input == ''
    end
    input
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

  def ask_publish_date
    publish_date = '0'
    until !(publish_date =~ /\d{4,4}/).nil? && publish_date.to_i.between?(1, 2022)
      print 'Insert publish_date[year, 4 digits]:'
      publish_date = gets.chomp
    end
    publish_date
  end

  def create_book(publisher, cover_state, publish_date)
    book = Book.new(publisher, cover_state, publish_date)
    @book_list.push(book)
  end

  def add_book
    publisher = ask_text('publisher')
    cover_state = ask_cover_state
    publish_date = ask_publish_date.to_i
    create_book(publisher, cover_state, publish_date)
  end

  def save_books
    book_list = @book_list.map do |book|
      { 'publisher' => book.publisher, 'cover_state' => book.cover_state, 'publish_date' => book.publish_date }
    end
    File.write('book_list.json', JSON.generate(book_list))
  end

  def load_books
    return [] unless File.exist?('book_list.json')

    raw_book_list = File.read('book_list.json')
    raw_book_list = JSON.parse(raw_book_list)
    arr = []
    raw_book_list.each do |book|
      arr.push(Book.new(book['publisher'], book['cover_state'], book['publish_date'].to_i))
    end
    arr
  end
end
