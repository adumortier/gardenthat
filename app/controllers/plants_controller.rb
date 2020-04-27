class PlantsController < ApplicationController
  def index
    json ||= PlantService.get_all_plants
    plants = json.map { |plant| ApiPlant.new(plant) }
    render locals: {plants: plants.paginate(:page => params[:page], :per_page => 24)}
  end
end
