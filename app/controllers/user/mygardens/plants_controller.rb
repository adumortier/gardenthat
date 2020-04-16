class User::Mygardens::PlantsController < User::BaseController
	def index
		@garden = Garden.find(params[:id])
	end

	def create
		garden = Garden.find(params[:garden_id])
		plant = Plant.find(params[:plant_id])
    garden.plants << plant
    garden.save
    add_notification(garden, plant)
		redirect_to("/user/mygardens/#{garden.id}")
  end

  def destroy
    garden_plant = GardenPlant.where("garden_id= #{params[:garden_id]} AND plant_id= #{params[:plant_id]}").first
    garden_plant.destroy
    redirect_to("/user/mygardens/#{params[:garden_id]}")
  end
  
  private 
  
  def add_notification(garden, plant)
    title = plant.name.capitalize + " harvest time!"
    description = "It's time to harvest your #{plant.name}"
    harvest_date = plant.first_harvest.to_i.days.from_now.to_s[0..9]
    response = CalendarService.post_events(garden.user, title, description, harvest_date)
    if response == 0 
      flash[:notice] = "We've updated your calendar with the harvest time of your #{plant.name.downcase}"
    else
      flash[:notice] = "We haven't been able to add the harvest time of your #{plant.name.downcase} to your calendar"
    end
  end 
end
