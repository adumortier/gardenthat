class ProfilesController < ApplicationController

  def new
  end

  def show
    if current_user.nil?
      render file: "/public/404"
    else
      @user = User.find(current_user.id)
    end
  end

  # def edit
  #   @user = User.find(session[:user_id])
  # end

  def create
    if current_user
      current_user.update(zip_code: params["zip_code"])
    end
    redirect_to root_path
  end

end
