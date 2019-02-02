class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    position_players = teams.collect do |team|
      if !team.eliminated?
      team.players_by_position(position)
      end
    end
    position_players.flatten.compact
  end

  def all_players_by_position
    position_players = Hash.new{|hash, key| hash[key] = []}
    teams.each do |team|
      team.players.each do |player|
        position_players[player.position] << player
      end
    end
    position_players
  end
end
