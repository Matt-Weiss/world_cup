require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'

class PlayerTest < Minitest::Test

  def test_it_exists
    player = Player.new({name: "Luka Modric", position: "midfielder"})

    assert_instance_of Player, player
  end

  def test_attributes
    # skip
    player = Player.new({name: "Luka Modric", position: "midfielder"})

    assert_equal "Luka Modric", player.name
    assert_equal "midfielder", player.position
  end
end
