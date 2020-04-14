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

  def edit
    @user = User.find(current_user.id)
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if user.save
      redirect_to "/profile/#{user.id}"
    else
      flash.now[:alert] = 'Empty Field. Please Fill in all fields.'
      render :edit
    end
  end

  def create
    if current_user
      current_user.update(zip_code: params["zip_code"])
    end
    redirect_to root_path
  end

  private

    def user_params
      params.permit(:zip_code)
    end
end
