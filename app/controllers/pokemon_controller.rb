require './config/environment'

class PokemonController < ApplicationController

get "/" do
  erb :welcome 
end

# creates a new pokemon object w/params assigned to the trainer. redirects to trainers home
post '/pokemon/new' do
  @pokemon = Pokemon.find_by_id(params['pokemon'])
  @trainer = current_user
  @pokemon_trainer = PokemonTrainer.create(pokemon_id: @pokemon.id, trainer_id: @trainer.id, nickname: @pokemon.name)
  @pokemon.trainer_id = @pokemon_trainer.trainer_id
  redirect '/pokemons'
end

get '/pokemons/:id' do
  @pokemon = Pokemon.find_by_id(params[:id])
  erb :'/pokemons/edit'
end

end