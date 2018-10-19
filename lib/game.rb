class Game
  attr_reader :player_1, :player_2

  def initialize(player_1:, player_2:)
    @players = [player_1, player_2]
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

  def switch
    @players.reverse!
  end

  def lost?
    player_2.hp <= 0
  end

end
