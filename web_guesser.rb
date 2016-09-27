require 'sinatra'
require 'sinatra/reloader'

  def generate_secret_number
    @@secret_number = rand(100)
    @@count = 6
  end

  def check_guess(guess)
    if (guess.to_i > 100) && (guess.to_i < 104)
      "Too high!"
    elsif guess.to_i >= 104
      "Way too high!"
    elsif (guess.to_i < -4)
      "Way too low!"
    elsif (guess.to_i < 0) && (guess.to_i >= -4)
      "Too low!"
    elsif guess.to_i == @@secret_number
      "You got it right!"
      "The SECRET NUMBER is #{@@secret_number}"
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
    elsif guess.to_i == @@secret_number
      "Green"
    end
  end

  def keeps_count(guess)
    if @@count == 1
      generate_secret_number
      return "You have lost, a new secret number has been generated"
    end

    if (guess.to_i > -1) && (guess.to_i < 101) && (guess != "")
      @@count -= 1
      return "You have #{@@count} guesses left . . ."
    end
  end

  def activate_cheat_mode(cheat)
    if cheat == "true"
      return "The super secret number is #{@@secret_number}"
    end
  end

  generate_secret_number

  get '/' do
    guess = params["guess"]
    cheat = params["cheat"]

    message = check_guess(guess)
    color_choice = choose_background_color(guess)
    display_count = keeps_count(guess)
    cheat_message = activate_cheat_mode(cheat)
    erb :index, :locals => {:message => message, :color_choice => color_choice, :display_count => display_count, :cheat_message => cheat_message}
  end
