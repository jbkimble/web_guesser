require 'sinatra'
require 'sinatra/reloader'

random_num = rand(101)

get '/' do
  "The SECRET NUMBER is #{random_num}"
end
