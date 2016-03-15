class CreateEnclosures < ActiveRecord::Migration
  def change
    create_table :enclosures do |t|
      t.integer :number
      t.string :type

      t.timestamps null: false
    end
    add_index :enclosures, :number
  end
end
