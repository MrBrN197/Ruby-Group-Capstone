require_relative '../modules/bookfunctions'
require_relative '../classes/label'

class App
  def initialize
    @book_list = load_books
    @label_list = [Label.new('gift', 'red'), Label.new('new', 'blue')]
  end
  include BookFunctions
end
