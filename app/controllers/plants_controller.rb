class PlantsController < ApplicationController
  def index
    # conn = Faraday.new "https://plantmicroservice.herokuapp.com/allplants"
    # response = conn.get
    # json = JSON.parse(response.body, symbolize_names: true)

    # plants = json.map do |plant|
    #   ApiPlant.new(plant)
    # end
    json = PlantService.new.get_all_plants
    plants = json.map do |plant|
      ApiPlant.new(plant)
    end
    render locals: {plants: plants.paginate(:page => params[:page], :per_page => 24)}
  end
end
