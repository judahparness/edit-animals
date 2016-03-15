class AddEnclosureToAnimal < ActiveRecord::Migration
  def change
    add_reference :animals, :enclosure, index: true, foreign_key: true
  end
end
