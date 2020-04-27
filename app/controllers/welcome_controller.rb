class WelcomeController < ApplicationController
  def index
    PlantLoaderJob.perform_later
  end

end
