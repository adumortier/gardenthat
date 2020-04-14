class User::Mygardens::PlantsController < User::BaseController
	def index
		@garden = Garden.find(params[:id])
	end

	def create
		garden = Garden.find(params[:garden_id])
		plant = Plant.find(params[:plant_id])
		garden.plants << plant
		garden.save
		redirect_to("/user/mygardens/#{garden.id}")
	end
end
