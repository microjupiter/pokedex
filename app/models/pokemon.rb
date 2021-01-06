class Pokemon < ActiveRecord::Base
  belongs_to :pokedexes
  has_many :trainer
end



# many pikachues would have many trainers
# join table. duplication will cause issue
# many to many
