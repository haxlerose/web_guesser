require 'sinatra'
require 'sinatra/reloader'

ran_num = rand(101)

get '/' do
  erb :index, :locals => {:ran_num => ran_num}
end
