class User::MygardensController < User::BaseController 
	def index
		@gardens = current_user.gardens
	end

	def new
	end

	def create
		garden = current_user.gardens.create(garden_params)
		if garden.save
			redirect_to '/user/mygardens'
		else
			flash[:notice] = "Your new garden needs a name"
			redirect_back(fallback_location: '/')
		end
	end

	private

	def garden_params
		params.permit(:name, 
			:address,
			:city,
			:state,
			:zip)
	end
end
