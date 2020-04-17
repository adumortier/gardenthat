# frozen_string_literal: true

class Visitors::BaseController < ApplicationController
  before_action :require_visitor

  def require_visitor
    render file: '/public/404' if current_user
  end
end
