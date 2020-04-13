class Garden < ApplicationRecord
	belongs_to :user, dependent: :destroy
	has_many :garden_plants
	has_many :plants, through: :garden_plants

	validates_presence_of :name
end
