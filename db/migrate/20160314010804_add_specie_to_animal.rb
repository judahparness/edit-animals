class AddSpecieToAnimal < ActiveRecord::Migration
  def change
    add_reference :animals, :specie, index: true, foreign_key: true
  end
end
