require './config/environment'

class PokemonController < ApplicationController

get "/" do
  erb :welcome 
end

post '/pokemon/new' do
  binding.pry
  
  erb :'pokemon/show'
end

# post '/capture' do
#   @pokemon = Pokemon.create(name: params[:name])
#   if pokemon
#     current_user.pokemon << pokemon
#     redirect '/home'
#   else
#     redirect '/'
# end
# end
  




end