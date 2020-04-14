class PlantsController < ApplicationController
  def index
    conn = Faraday.new "https://plantmicroservice.herokuapp.com/allplants"
    response = conn.get
    json = JSON.parse(response.body, symbolize_names: true)

    plants = json.map do |plant|
      ApiPlant.new(plant)
    end

    @plants = plants.paginate(:page => params[:page], :per_page => 25)
  end
end
