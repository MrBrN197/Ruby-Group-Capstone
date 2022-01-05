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
    publish_date = ask_publish_date.to_i
    is_multiplayer = ask_text('Multiplayer (Y/n)').downcase
    last_played_date = ask_last_played_date
    Game.new(publish_date, is_multiplayer, last_played_date)
  end

  def add_game
    game = create_game
    @games_list << game
  end

  # TODO: refactor to different module
  def save_games
    data = @games_list.map { |game| JSON.generate(game) }
    Dir.mkdir('json') unless Dir.exist?('json')
    File.write('json/games_list.json', JSON.generate(data))
  end

  def load_games
    filename = 'json/games_list.json'
    return [] unless File.exist?(filename)

    raw_game_list = File.read(filename)
    raw_game_list = JSON.parse(raw_game_list)
    puts raw_game_list[0]['publish_date']

    raw_game_list.map do |game|
      puts 'publish_date:', game['publish_date']
      puts 'last_played_date:', game['last_played_date']
      puts 'is_multiplayer:', game['multiplayer']
      Game.new(game['publish_date'], game['multiplayer'], game['last_played_date'])
    end
  end
end
