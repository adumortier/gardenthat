class User::PlantsController < User::BaseController
	def create
		plant = Plant.where(name: params[:name]).first
		if !plant
			plant = Plant.create(plant_params)
		end
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
