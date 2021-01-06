class Pokedex < ActiveRecord::Base
  has_many :pokemons
  belongs_to :trainer
  
end
