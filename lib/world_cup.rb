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
end
