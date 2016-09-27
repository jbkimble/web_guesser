require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

def check_guess(guess)
  if (guess.to_i > 100) && (guess.to_i < 104)
    "Too high!"
  elsif guess.to_i >= 104
    "Way too high!"
  elsif (guess.to_i < -4)
    "Way too low!"
  elsif (guess.to_i < 0) && (guess.to_i >= -4)
    "Too low!"
  elsif guess.to_i == SECRET_NUMBER
    "You got it right!"
    "The SECRET NUMBER is #{SECRET_NUMBER}"
  end
end

def choose_background_color(guess)
  if (guess.to_i > 100) && (guess.to_i < 104)
    "Pink"
  elsif guess.to_i >= 104
    "Red"
  elsif (guess.to_i < -4)
    "Red"
  elsif (guess.to_i < 0) && (guess.to_i >= -4)
    "Pink"
  elsif guess.to_i == SECRET_NUMBER
    "Green"
  end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  color_choice = choose_background_color(guess)
  erb :index, :locals => {:message => message, :color_choice => color_choice}
end
