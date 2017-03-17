class Visit < ApplicationRecord
	belongs_to :dog
	validates_presence_of :dog_id
end
