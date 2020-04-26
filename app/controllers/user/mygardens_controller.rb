class User::MygardensController < User::BaseController 
	def index
		render locals: {gardens: User.find(current_user.id).gardens}
	end

	def new
	end

	def show
		@plant = Plant.find(params[:id])
	end

	def create
    garden = current_user.gardens.create(garden_params)
    return redirect_to user_mygardens_path if garden.save
		
		flash[:notice] = "Your new garden needs a name"
		redirect_back(fallback_location: root_path)
	end

	def destroy
		Garden.find(params[:id]).destroy
		redirect_to user_mygardens_path
	end

	private

	def garden_params
		params.permit(:name, :address, :city, :state, :zip)
  end
  
end
