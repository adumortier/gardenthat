class SearchController < ApplicationController

  def index
    result = PlantService.new.get_multiple_info(params['search'])
    @plants = result.map do |plant|
      ApiPlant.new(plant)
    end
  end

  def show
    result = PlantService.new.get_individual_plant_details(params['format'])
    return @error = "Bad Plant" if result == "Bad Plant"
    @plant = ApiPlant.new(result)
  end
end
