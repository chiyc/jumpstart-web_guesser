require 'sinatra'
require 'sinatra/reloader'

x = rand(101)
ng = 5
reset = false

get '/' do
#  throw params.inspect

  g = params['guess']
  cheat = false
  cheat = params['cheat']
  message = nil

  if reset  # if last guess was correct, assign new number and reset correct flag
    x = rand(101)
    reset = false
  end
  
  if g != nil  # if a guess is entered, check guess and decrement tries left
    g = g.to_i
    message = check(g, x)
    ng -= 1
  end
  g = g.to_i


  if message == "You got it right!" # if the guess was correct
    reset = true
    message += "\nA new number has been generated."
    ng = 5
  end
  if ng == 0
    reset = true
    message = "You lost! A new number has been generated."
    ng = 5
  end

  erb :index, :locals => { :number => x, :guess => g, :no_guesses => ng, 
                           :cheat => cheat, :message => message }


end

def check(guess, number)
  if guess > number + 5
    return "Way too high!"
  elsif guess > number
    return "Too high!"
  elsif guess < number - 5
    return "Way too low!"
  elsif guess < number
    return "Too low!"
  else
    return "You got it right!"
  end
end