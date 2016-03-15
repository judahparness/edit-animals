class CreateAnimalEnclosure < ActiveRecord::Migration
  def change
    create_table :animal_enclosures do |t|
      t.references :animal, index: true, foreign_key: true
      t.references :enclosure, index: true, foreign_key: true
    end
  end
end
