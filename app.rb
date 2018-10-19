require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(name: params[:player_1_name])
    player_2 = Player.new(name: params[:player_2_name])
    @game = Game.create(player_1: player_1, player_2: player_2)
    redirect '/play'
  end

  get '/play' do
    @game = Game.instance
    erb :play
  end

  get '/attack' do
    @game = Game.instance
    @game.attack(@game.player_2)
    redirect '/player_lost' if @game.lost?
    @game.switch
    erb :attack
  end

  get '/player_lost' do
    @game = Game.instance
    erb :player_lost
  end

  def player_score(player)
    "#{player[:name]} : #{player[:score]}"
  end
end
