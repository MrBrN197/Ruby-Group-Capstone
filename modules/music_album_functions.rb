require_relative '../classes/musical_album'
require_relative './associations'
require_relative './utils/input'
require_relative './utils/storage'

module MusicAlbumsFunctions
  include Associations
  include Input

  def list_all_albums
    puts 'Music Albums: '
    puts '---------------------------'
    if @music_albums_list.empty?
      puts 'No Music Albums to List'
    else
      puts @music_albums_list
    end
    puts '---------------------------'
    puts ''
  end

  def list_all_genres
    puts 'Genres: '
    puts '---------------------------'
    puts @genres_list
    puts '---------------------------'
    puts ''
  end

  def create_album
    publish_date = ask_year('Publish Date').to_i
    is_on_spotify = ask_text('On Spotify (Y/n)').downcase == 'y'
    MusicAlbum.new(publish_date, on_spotify: is_on_spotify)
  end

  def add_music_album
    album = create_album
    attach_info(album)
    @music_albums_list << album
    save_albums
  end

  def save_albums
    JSONStorage.save('albums_list', @music_albums_list)
  end

  def load_albums
    raw_albums_list = JSONStorage.load('albums_list')
    return [] unless raw_albums_list

    raw_albums_list.map { |album| MusicAlbum.new(album['publish_date'], on_spotify: album['on_spotify']) }
  end
end
