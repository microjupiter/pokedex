require './config/environment'

class PokemonController < ApplicationController

get "/" do
  erb :welcome 
end

post '/pokemon/new' do
  @pokemon = Pokemon.find_by_id(params['pokemon'])
  @trainer = current_user
  @pokemon_trainer = PokemonTrainer.create(pokemon_id: @pokemon.id, trainer_id: @trainer.id)
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