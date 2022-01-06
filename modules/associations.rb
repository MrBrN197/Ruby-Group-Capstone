require_relative '../classes/author'
require_relative '../classes/label'
require_relative '../classes/genre'
require_relative './utils/input'

module Associations
  def attach_info(game)
    label = ask_label
    genre = ask_genre
    author = ask_author
    author.add_item(game)
    label.add_item(game)
    genre.add_item(game)
    game
  end

  private

  def ask_label
    title = ask_text('Label Title')
    color = ask_text('Label Color')
    Label.new(title, color)
  end

  def ask_author
    first_name = ask_text('Author First Name')
    last_name = ask_text('Author Last Name')
    Author.new(first_name, last_name)
  end

  def ask_genre
    genre = ask_text('Genre: ')
    Genre.new(genre)
  end
end
