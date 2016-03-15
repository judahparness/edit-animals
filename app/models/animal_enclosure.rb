class AnimalEnclosure < ActiveRecord::Base
  belongs_to :animal
  belongs_to :enclosure
end
