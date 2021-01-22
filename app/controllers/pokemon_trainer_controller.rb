class PokemonTrainerController < ApplicationController
  delete '/pokemon_trainers/:id' do 
    if logged_in?
    @pokemon_trainer = PokemonTrainer.find_by(trainer_id: current_user.id, pokemon_id: params["pokemon"])
    @pokemon_trainer.destroy
    redirect '/pokemons'
    else
      redirect '/'
  end 
end

  # allows for user to edit pokemon nickname and reload captured pokemon page
  patch '/pokemon_trainers/:id/edit' do
    @pokemon_trainer = PokemonTrainer.find_by(trainer_id: current_user.id, pokemon_id: params["pokemon"])
    
    @pokemon_trainer.update(nickname: params["name"])
    
    
    redirect '/show'
  end
end

destroy '/pokemon_trainers/:id' do
if logged_in?
  @pokemon_trainer = PokemonTrainer.find_by(trainer_id: current_user.id, pokemon_id: params["pokemon"])
  @pokemon_trainer.destroy
  redirect '/pokemons'
  else
    redirect '/'
end 
end