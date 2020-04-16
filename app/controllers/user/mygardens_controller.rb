class User::MygardensController < User::BaseController 
	def index
		@gardens = User.find(current_user.id).gardens
	end

	def new
	end

	def show
		@plant = Plant.find(params[:id])
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

	def destroy
		garden = Garden.find(params[:id]).destroy
		redirect_to('/user/mygardens')
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
