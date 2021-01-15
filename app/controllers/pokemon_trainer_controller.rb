class PokemonTrainerController < ApplicationController
  delete '/pokemon_trainers/:id' do 
    @pokemon_trainer = PokemonTrainer.find_by(trainer_id: current_user.id, pokemon_id: params["pokemon"])
    @pokemon_trainer.destroy
    redirect '/pokemons'
  end 

  # allows for user to edit pokemon nickname and reload captured pokemon page
  patch '/pokemon_trainers/:id/edit' do
    @pokemon_trainer = PokemonTrainer.find_by(trainer_id: current_user.id, pokemon_id: params["pokemon"])
    
    @pokemon_trainer.nickname = params["name"]
    @pokemon_trainer.save
    
    redirect '/show'
  end

  # private
  # def nickname_params
  #   @nickname = params["name"]
  #   params.require("name")
  # end

end