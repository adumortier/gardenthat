class ProfilesController < ApplicationController

  def new
  end

  def show
    return render file: "/public/404" if current_user.nil?
    return render locals: {user: User.find(current_user.id) }
  end

  def edit
    render locals: {user: User.find(current_user.id) }
  end

  def update
    User.find(params[:id]).update(user_params)
    flash[:notice] = 'Profile Updated!'
    redirect_to "/profile/#{params[:id]}"
  end

  def create
    current_user.update(user_params) if current_user
    redirect_to root_path
  end

  def destroy
    User.find(params[:id]).destroy
    session.clear
    redirect_to root_path
    flash[:alert] = "Profile Deleted"
  end

  private

    def user_params
      params.permit(:zip_code, :name)
    end
end
