require_relative '../classes/game'
require_relative './associations'
require_relative './utils/input'
require_relative './utils/storage'

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

  def save_games
    JSONStorage.save('games_list', @games_list)
  end

  def load_games
    raw_games_list = JSONStorage.load('games_list')
    return [] unless raw_games_list

    raw_games_list.map { |game| Game.new(game['publish_date'], game['multiplayer'], game['last_played_date']) }
  end
end
