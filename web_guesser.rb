require 'sinatra'
require 'sinatra/reloader'

number = rand(101)

def check_guess(guess, n)
  g = params['guess'].to_i
  if g > n
    if g > n + 5
      message = "#{g} is way too high!"
    else
      message = "#{g} is too high!"
    end
  elsif g == n
    message = "#{g} is CORRECT!!  The random number is #{n}."
  elsif g < n
    if g < n - 5
      message = "#{g} is way too low!"
    else
      message = "#{g} is too low!"
    end
  end
  # message = "#{g} is CORRECT!!  The random number is #{n}." if g == n
  # message = "#{g} is #{g > n + 5  ? 'way' : nil} too high!" if g > n
  # message = "#{g} is #{g < n - 5  ? 'way' : nil} too low!" if g < n
end


get '/' do
  guess = params["guess"]
  message = check_guess(guess, number)
  erb :index, :locals => {:number => number, :message => message}
end
