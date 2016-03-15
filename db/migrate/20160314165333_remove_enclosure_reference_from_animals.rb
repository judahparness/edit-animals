class RemoveEnclosureReferenceFromAnimals < ActiveRecord::Migration
  def change
  	remove_column :animals, :enclosure_id
  end
end
