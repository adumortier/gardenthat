class User::Mygardens::PlantsController < User::BaseController
	def index
		@garden = Garden.find(params[:id])
	end
end
