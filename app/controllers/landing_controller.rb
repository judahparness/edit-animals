class LandingController < ApplicationController
	def index
		@animals = Animal.all
		@animal_count = @animals.count
		
		@enclosures = Enclosure.all
		@enclosure_count = @enclosures.count

		@species = Specie.all
		@species_count = @species.count
	end
end