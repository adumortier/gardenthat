class SearchController < ApplicationController

  def index
    conn = Faraday.new "https://plantmicroservice.herokuapp.com/api/"
    request = params['search'].strip.gsub(' ','-')
    response = conn.get(request)
    json = JSON.parse(response.body, symbolize_names: true)
    @plant = ApiPlant.new(json)
  end

  def show
    conn = Faraday.new "https://plantmicroservice.herokuapp.com/api/"
    request = params['format'].strip.gsub(' ','-')
    response = conn.get(request)
    json = JSON.parse(response.body, symbolize_names: true)
    @plant = ApiPlant.new(json)
  end

end
