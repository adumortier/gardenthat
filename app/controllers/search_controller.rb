class SearchController < ApplicationController

  def index
    result = PlantService.new.get_search_info(params['search'])
    @plant = ApiPlant.new(result)
  end

  def show
    result = PlantService.new.get_search_info(params['format'])
    @plant = ApiPlant.new(result)
  end
end
