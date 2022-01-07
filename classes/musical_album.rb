require_relative 'item'

class MusicAlbum < Item
  def initialize(publish_date, on_spotify: false)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def to_s
    %(On Spotify: #{@on_spotify} Published Year: #{@publish_date.year})
  end

  def to_json(json)
    json.generate({ on_spotify: @on_spotify, publish_date: @publish_date.year })
  end

  private

  def can_be_archived?
    super && @on_spotify == true
  end
end
