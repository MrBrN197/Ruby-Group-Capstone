require_relative '../classes/game'
require 'date'
require 'json'

describe Game do
  it 'should initialize Game class correctly' do
    game = Game.new(2006, true, 2019)
    expect(game).to be_an_instance_of(Game)
  end

  it 'test JSON representation is correct' do
    game = Game.new(2006, true, 2019)
    data = JSON.generate(game)
    parsed_date = JSON.parse(data)
    puts parsed_date.class
    expect(parsed_date).to include(
      'multiplayer' => true,
      'publish_date' => 2006,
      'last_played_date' => 2019
    )
  end

  it 'test `can_be_archived` method functions correctly' do
    year = DateTime.now.year
    expect(Game.new(year - 11, true, year - 1).can_be_archived?).to be(false)
    expect(Game.new(year - 11, true, year - 5).can_be_archived?).to be(true)
    expect(Game.new(year - 8, true, year - 0).can_be_archived?).to be(false)
    expect(Game.new(year - 6, true, year - 6).can_be_archived?).to be(false)
    expect(1).to be(1)
  end
end
