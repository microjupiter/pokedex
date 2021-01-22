class Trainer < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username, :password_digest
  validates :username, uniqueness: true
  has_many :pokemons, through: :pokemon_trainers
  has_many :pokemon_trainers
end
