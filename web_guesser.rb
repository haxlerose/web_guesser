require 'sinatra'
require 'sinatra/reloader'

ran_num = rand(101)

get '/' do
  "Your random number is #{ran_num}!"
end
