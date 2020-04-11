class ProfilesController < ApplicationController

  def new
  end

  def create
    if current_user
      current_user.update(zip_code: params["zip_code"])
    end
    redirect_to root_path
  end

end