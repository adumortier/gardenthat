class User::Mygardens::PlantsController < User::BaseController
  def index
    render locals: { garden: Garden.find(params[:id]) }
  end

  def create
    result = update_garden
    flash[:notice] = "We're updating your calendar with the harvest time of your #{result[:plant].name.downcase}"
    redirect_to user_path(result[:garden].id)
  end

  def destroy
    remove_garden
    redirect_to user_path(params[:garden_id])
  end

  private 

  def update_garden
    garden = Garden.find(params[:garden_id])
    plant = Plant.find(params[:plant_id])
    garden.plants << plant
    garden.save
    NotificationSenderJob.perform_later(garden, plant)
    { garden: garden, plant: plant }
  end

  def remove_garden
    garden_plant = GardenPlant.where("garden_id= #{params[:garden_id]} AND plant_id= #{params[:plant_id]}").first
    events = garden_plant.events.to_a
    NotificationRemoverJob.perform_later(events, current_user)
    garden_plant.destroy
  end

end
