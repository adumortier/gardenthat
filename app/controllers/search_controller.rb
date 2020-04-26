class SearchController < ApplicationController

  def index
    result = PlantService.get_multiple_info(params['search'])
    plants = result.map { |plant| ApiPlant.new(plant) }
    render locals: {plants: plants}
  end

  def show
    result = PlantService.get_individual_plant_details(params['format'])
    return @error = "Bad Plant" if result == "Bad Plant"
    render locals: {plant: ApiPlant.new(result)}
  end
end
