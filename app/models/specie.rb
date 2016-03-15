class Specie < ActiveRecord::Base
	has_many :animals
	has_many :enclosures, through: :animals
end
