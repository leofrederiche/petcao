class Dog < ApplicationRecord
	validates_presence_of :breed,
			:gender,
			:birth,
			:dog_name,
			:owner_name,
			:tel

	validates_uniqueness_of :owner_name, scope: :dog_name

	has_many :visits
end