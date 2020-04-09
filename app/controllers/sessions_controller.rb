# frozen_string_literal: true

class SessionsController < ApplicationController
  def googleAuth
    access_token = request.env['omniauth.auth']
    user = User.from_omniauth(access_token)
    log_in(user)

    user.google_token = access_token.credentials.token

    refresh_token = access_token.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    user.save
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
end
