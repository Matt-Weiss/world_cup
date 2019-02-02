require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'

class TeamTest < Minitest::Test

  def test_it_exists
    team = Team.new("France")

    assert_instance_of Team, team
  end

  def test_attributes
    team = Team.new("France")

    assert_equal "France", team.country
  end

  def test_team_starts_not_eliminated
    team = Team.new("France")

    refute team.eliminated?
  end

  def test_team_can_be_eliminated
    team = Team.new("France")
    team.eliminated = true

    assert team.eliminated?
  end

  def test_players_starts_as_empty_array
    team = Team.new("France")

    assert_equal [], team.players
  end

  def test_can_add_players
    team = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    team.add_player(mbappe)
    team.add_player(pogba)

    assert_equal [mbappe, pogba], team.players
  end

  def test_can_sort_players_by_category
    team = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    team.add_player(mbappe)
    team.add_player(pogba)

    assert_equal [pogba], team.players_by_position("midfielder")
    assert_equal [], team.players_by_position("defender")
  end
end
