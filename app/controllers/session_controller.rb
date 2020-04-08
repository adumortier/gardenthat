class SessionController < ApplicationController 
  def new; end

	def destroy
		redirect_to '/'
	end
end
