require 'sinatra'
require 'sinatra/reloader'

number = rand(101)
@@guess_num = 5
end_message = nil

def check_guess(guess, number)
  if guess == number
    message = "#{guess} is CORRECT!!  The random number is #{number}. Try again!"
  elsif guess > number
    if guess > number + 5
      message = "#{guess} is way too high!"
    else
      message = "#{guess} is too high!"
    end
  elsif guess < number
    if guess < number - 5
      message = "#{guess} is way too low!"
    else
      message = "#{guess} is too low!"
    end
  end
end


get '/' do
  guess = params["guess"].to_i
  if guess != nil && guess >= 1 && guess <= 100
    message = check_guess(guess, number)
  else
    message = "Guess an integer between 1 and 100"
  end

  if @@guess_num == 0 && number != params['guess'].to_i
    end_message = "Out of guesses!  Guess an integer between 1 and 100"
    number = rand(101)
    @@guess_num = 5
  else
    end_message = nil
  end

  if number == params['guess'].to_i
    number = rand(101)
    @@guess_num = 5
  end

  @@guess_num -= 1

  erb :index, :locals => {:number => number, :message => message, :end_message => end_message}
end
