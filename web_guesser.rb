require 'sinatra'
require 'sinatra/reloader'

x = rand(101)

get '/' do
  erb :index, :locals => { :number => x }
end