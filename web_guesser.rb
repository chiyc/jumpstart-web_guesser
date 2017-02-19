require 'sinatra'
require 'sinatra/reloader'

x = rand(101)
ng = 5

get '/' do
#  throw params.inspect
  g = params['guess'].to_i
  erb :index, :locals => { :number => x, :guess => g, :no_guesses => ng }
end