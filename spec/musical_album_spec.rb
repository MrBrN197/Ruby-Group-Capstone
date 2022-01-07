require_relative '../classes/musical_album'

describe MusicAlbum do
  context 'Tests for the MusicAlbum class' do
    music_album = MusicAlbum.new(2000, on_spotify: false)
    music_album2 = MusicAlbum.new(2020, on_spotify: true)
    music_album3 = MusicAlbum.new(2010, on_spotify: true)

    it 'is an instance of class Item' do
      expect(music_album).to be_an_instance_of(MusicAlbum)
    end

    it 'archive status changes based on the move_to_archive method' do
      music_album.move_to_archive
      music_album2.move_to_archive
      music_album3.move_to_archive
      expect(music_album.archived).to be(false)
      expect(music_album2.archived).to be(false)
      expect(music_album3.archived).to be(true)
    end
  end
end
