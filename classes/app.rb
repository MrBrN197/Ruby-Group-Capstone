require_relative '../modules/bookfunctions'
require_relative '../modules/game_functions'
require_relative '../classes/label'
require_relative '../classes/author'
require_relative '../classes/game'

class App
  def initialize
    @book_list = load_books
    @label_list = [Label.new('gift', 'red'), Label.new('new', 'blue')]
    @games_list = []
    @authors_list = [Author.new('Suzanne', 'Collins'), Author.new('George', 'R.R Martin')]
  end
  include BookFunctions
  include GameFunctions
end
