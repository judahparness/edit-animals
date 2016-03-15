class CreateSpecies < ActiveRecord::Migration
  def change
    create_table :species do |t|
      t.string :latin_name
      t.string :canonical_name

      t.timestamps null: false
    end
    add_index :species, :latin_name
    add_index :species, :canonical_name
  end
end
