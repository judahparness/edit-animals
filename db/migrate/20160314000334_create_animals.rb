class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :animals, :name
  end
end