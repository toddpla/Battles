require 'sinatra/base'
require './lib/player'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    $player_1 = Player.new(name: params[:player_1_name])
    $player_2 = Player.new(name: params[:player_2_name])
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
    erb :attack
  end

  post '/attack' do
    $player_2.reduce_hp
    redirect to('/attack')
  end

  def player_score(player)
    "#{player[:name]} : #{player[:score]}"
  end
end
