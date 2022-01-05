require_relative '../classes/author'

module GameFunctions
  def list_all_games
    @games_list.each { |game| puts game }
  end

  def list_all_authors
    @authors_list.each { |author| puts author }
  end
end
