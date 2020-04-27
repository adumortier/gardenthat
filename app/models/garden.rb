class Garden < ApplicationRecord
	belongs_to :user
	has_many :garden_plants, dependent: :destroy
	has_many :plants, through: :garden_plants

  validates_presence_of :name
  

  def self.add_notification(garden, plant)
    info = self.notification_parameters(garden, plant)
    response = CalendarService.post_events(garden.user, info[0], info[1], info[2])
    garden_plant = GardenPlant.where("garden_id= #{garden.id} AND plant_id= #{plant.id}").first
    garden_plant.events.create(event_id: response[:id])
  end 


  def self.remove_notifications(garden_plant_events, user)
    garden_plant_events.each do |event|
      CalendarService.delete_event(user, event.event_id)
      event.destroy
    end
  end

  def self.notification_parameters(garden, plant)
    title = plant.name.capitalize + " harvest time!"
    description = "It's time to harvest your #{plant.name} in #{garden.name}"
    harvest_date = plant.first_harvest.to_i.days.from_now.to_s[0..9]
    return [title, description, harvest_date]
  end


end
