class Game

  def initialize(players:)
    @players = players
  end

  def attack(player)
    player.reduce_hp
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

end
