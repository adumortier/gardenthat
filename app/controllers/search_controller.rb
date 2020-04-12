class SearchController < ApplicationController

  def index
    conn = Faraday.new "https://plantmicroservice.herokuapp.com/api/"
    request = params['search'].strip.gsub(' ','-')
    response = conn.get(request) 
    json = JSON.parse(response.body, symbolize_names: true)
    @plant = Plant.new(json)
  end

end 