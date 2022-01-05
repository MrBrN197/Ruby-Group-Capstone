require_relative '../classes/author'
require_relative '../classes/game'

module GameFunctions
  def list_all_games
    @games_list.each { |game| puts game }
  end

  def list_all_authors
    @authors_list.each { |author| puts author }
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
    publish_date = ask_publish_date
    is_multiplayer = ask_text('Multiplayer (Y/n)').downcase
    last_played_date = ask_last_played_date
    Game.new(publish_date, is_multiplayer, last_played_date)
  end

  def add_game
    game = create_game
    @games << game
  end
end
