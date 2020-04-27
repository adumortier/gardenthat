class PlantLoaderJob < ApplicationJob
  queue_as :default

  def perform
    PlantService.get_all_plants
  end
  
end
