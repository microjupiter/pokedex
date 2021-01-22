class Pokemon < ActiveRecord::Base
  has_many :trainers, through: :pokemon_trainers
  has_many :pokemon_trainers
end



# many pikachues would have many trainers
# join table. duplication will cause issue
# many to many
