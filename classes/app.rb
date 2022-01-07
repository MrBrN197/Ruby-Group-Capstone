require_relative '../modules/bookfunctions'
require_relative '../modules/game_functions'
require_relative '../modules/music_album_functions'
require_relative '../classes/label'
require_relative '../classes/author'
require_relative '../classes/game'
require_relative '../classes/genre'

class App
  def initialize
    @book_list = load_books
    @games_list = load_games
    @music_albums_list = load_albums
    @label_list = [Label.new('gift', 'red'), Label.new('new', 'blue')]
    @authors_list = [Author.new('Suzanne', 'Collins'), Author.new('George', 'R.R Martin')]
    @genres_list = [Genre.new('Action'), Genre.new('Fantasy')]
  end

  include BookFunctions
  include GameFunctions
  include MusicAlbumsFunctions

  def save_data
    save_books
    save_albums
    save_books
  end

  def start
    puts 'Welcome'
    puts 'Please choose an option by entering a number:'

    loop do
      display_options
      handle_input
    end
  end

  private

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  def handle_input
    n = Integer(gets.chomp)
    case n
    when 1
      list_all_books
    when 2
      list_all_albums
    when 3
      list_all_games
    when 4
      list_all_genres
    when 5
      list_all_labels
    when 6
      list_all_authors
    when 7
      add_book
    when 8
      add_music_album
    when 9
      add_game
    when 10
      save_data
      puts 'Goodbye'
      exit
    else
      puts 'Please select a number between 1-13'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength

  def display_options
    puts '1  - List all books'
    puts '2  - List all music albums'
    puts '3  - List of games'
    puts '4  - List all genres'
    puts '5  - List all labels'
    puts '6  - List all authors'
    puts '7  - Add a book'
    puts '8  - Add a music album'
    puts '9  - Add a game'
    puts '10 - Exit'
  end
end
