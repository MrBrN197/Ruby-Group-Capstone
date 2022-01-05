require_relative './item'

class Game < Item
  def initialize(publish_date, multiplayer, last_played_date)
    super(publish_date)
    @last_played_date = Date.new(last_played_date)
    @multiplayer = multiplayer
  end

  def can_be_archived?
    duration = Time.now.year - last_played_date.year
    super && duration > 2
  end

  def to_json(json)
    data = { last_played_date: @last_played_date.year, multiplayer: @multiplayer, publish_date: @publish_date.year }
    json.generate(data)
  end
end
