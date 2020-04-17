# frozen_string_literal: true

class User::PlantsController < User::BaseController
  def create
    name = params[:name]
    plant = Plant.where(name: name).first
    plant ||= Plant.create(plant_params)
    redirect_to user_plants_mygardens_path(plant.id)
  end

  private

  def plant_params
    params.permit(
      :name,
      :image,
      :perennial,
      :first_harvest,
      :last_harvest,
      :description,
      :sun,
      :height,
      :spread,
      :sowing,
      :spacing
    )
  end
end
