class User::MygardensController < User::BaseController 
	def index
		@gardens = current_user.gardens
	end
end
