class Game

  def initialize(players:)
    @players = players
  end

  def attack(player)
    player.reduce_hp
  end
    
end
