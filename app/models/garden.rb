class Garden < ApplicationRecord
	belongs_to :user
	has_many :garden_plants, dependent: :destroy
	has_many :plants, through: :garden_plants

	validates_presence_of :name
end
