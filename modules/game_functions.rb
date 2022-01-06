require_relative '../classes/game'
require_relative './associations'
require_relative './utils/input'

module GameFunctions
  include Associations
  include Input

  def list_all_games
    puts 'Games: '
    puts '---------------------------'
    if @games_list.empty?
      puts 'No Games to List'
    else
      puts @games_list
    end
    puts '---------------------------'
    puts ''
  end

  def list_all_authors
    puts 'Authors: '
    puts '---------------------------'
    puts @authors_list
    puts '---------------------------'
    puts ''
  end

  # TODO: should refactor to ask date
  def ask_last_played_date
    last_played_date = '0'
    until !(last_played_date =~ /\d{4,4}/).nil? && last_played_date.to_i.between?(1, 2022)
      print 'Insert last_played_date[year, 4 digits]:'
      last_played_date = gets.chomp
    end
    last_played_date
  end

  def create_game
    publish_date = ask_publish_date.to_i
    is_multiplayer = ask_text('Multiplayer (Y/n)').downcase == 'y'
    last_played_date = ask_last_played_date.to_i
    Game.new(publish_date, is_multiplayer, last_played_date)
  end

  def add_game
    game = create_game
    attach_info(game)
    @games_list << game
    save_games
  end

  # TODO: refactor to different module
  def save_games
    data = @games_list.map { |game| game }
    Dir.mkdir('json') unless Dir.exist?('json')
    File.write('json/games_list.json', JSON.generate(data))
  end

  def load_games
    filename = 'json/games_list.json'
    return [] unless File.exist?(filename)

    raw_game_list = JSON.parse(File.read(filename))
    raw_game_list.map { |game| Game.new(game['publish_date'], game['multiplayer'], game['last_played_date']) }
  end
end
