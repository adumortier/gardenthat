class PlantService
  def conn
    Faraday.new "https://plantmicroservice.herokuapp.com"
  end

  def get_individual_plant_details(search_params)
    response = conn.get("/plant/#{search_params}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_multiple_info(search_param)
    request = search_param.strip.gsub(' ','-')
    response = conn.get("/api/#{request}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
