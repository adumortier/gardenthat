# frozen_string_literal: true

class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def googleAuth
    access_token = request.env['omniauth.auth']
    user = User.from_omniauth(access_token)
    user.google_token = access_token.credentials.token
    refresh_token = access_token.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    user.save
    if user.calendar_id.nil?
      CalendarService.create_calendar(user, 'GardenThatApp')
      flash[:notice] = 'Your GardenThat calendar was created.'
    end
    log_in(user)
    return redirect_to profile_questionaire_path if user.zip_code.nil?

    redirect_to root_path
  end
end
