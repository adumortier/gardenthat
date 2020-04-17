class Event < ApplicationRecord

  validates_presence_of :event_id

  belongs_to :garden_plant


end