class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :type
      t.string :region
      t.string :height
      t.string :sprite

      t.timestamps null: false
    end
  end
end
