class RenameTypeinEnclosureTable < ActiveRecord::Migration
  def change
  	rename_column :enclosures, :type, :enclosure_type
  	rename_column :enclosures, :number, :enclosure_number
  end
end
