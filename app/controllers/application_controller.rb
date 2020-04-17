# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user

  def log_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
