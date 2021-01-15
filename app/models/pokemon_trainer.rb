class PokemonTrainer < ActiveRecord::Base
  belongs_to :trainers
  belongs_to :pokemon
end
