require 'sinatra/base'



class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    session[:player_1] = { name: params[:player_1_name], score: 100 }
    session[:player_2] = { name: params[:player_2_name], score: 100 }
    redirect '/play'
  end

  get '/play' do
    session[:current_player] ||= :player_1
    @player_1_name = session[:player_1][:name]
    @player_2_name = session[:player_2][:name]
    @opponent_score = player_score(session[:player_2])
    session[:current_player] == :player_1 ? session[:current_player] == :player_2 : session[:current_player] == :player_1
    erb :play
  end

  get '/attack' do
    @player_1_name = session[:player_1][:name]
    @player_2_name = session[:player_2][:name]
    erb :attack
  end

  def player_score(player)
    "#{player[:name]} : #{player[:score]}"
  end
end
