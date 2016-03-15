class Animal < ActiveRecord::Base
	belongs_to :specie
	belongs_to :enclosure
end
