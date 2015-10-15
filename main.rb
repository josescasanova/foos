require 'rubygems'
require 'sinatra'
require 'json'

get "/" do
  "Hello world"
end

get '/game' do
  names = ['Seb', 'Jose', 'Chachi', 'Alvaro', 'Paul']
  players = []

  while players.count < 4 do
    player = names.sample
    if !players.include?(player)
      players << player
    end
  end

  first_team = players.first(2)
  second_team = players.last(2)

  text = "#{first_team[0]}/#{first_team[1]} VS #{second_team[0]}/#{second_team[1]}"
  
  content_type :json
  return { :text => text }.to_json
end
