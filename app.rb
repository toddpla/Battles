require 'sinatra/base'
require './lib/player'
require 'game'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    $player_1 = Player.new(name: params[:player_1_name])
    $player_2 = Player.new(name: params[:player_2_name])
    $game = Game.new(players: [$player_1, $player_2])
    redirect '/play'
  end

  get '/play' do
    @player_1_name = $player_1.name
    @player_1_hp = $player_1.hp
    @player_2_name = $player_2.name
    @player_2_hp = $player_2.hp
    erb :play
  end

  get '/attack' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    $game.attack($player_2)
    erb :attack
  end

  def player_score(player)
    "#{player[:name]} : #{player[:score]}"
  end
end
