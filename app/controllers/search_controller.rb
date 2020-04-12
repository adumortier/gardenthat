class SearchController < ApplicationController

  def index
    result = PlantService.new.get_search_info(params['search'])
    @plant = Plant.new(result)
  end

  def show
    result = PlantService.new.get_search_info(params['format'])
    @plant = Plant.new(result)
  end
end
