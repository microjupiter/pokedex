require './config/environment'

class PokemonController < ApplicationController

get "/" do
  erb :welcome 
end

post '/pokemon/new' do
  @pokemon = Pokemon.find_by_id(params['pokemon'])
  @trainer = current_user
  @pokemon_trainer = PokemonTrainer.create(pokemon_id: @pokemon.id, trainer_id: @trainer.id, nickname: @pokemon.name)
  @pokemon.trainer_id = @pokemon_trainer.trainer_id
  redirect '/home'
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