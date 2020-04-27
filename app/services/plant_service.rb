class PlantService
  def self.conn
    Faraday.new "https://plantmicroservice.herokuapp.com"
  end

  def self.get_individual_plant_details(search_params)
    request = search_params.strip.gsub(' ','-').downcase
    response = conn.get("/plant/#{request}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_multiple_info(search_params)
    search_params = "A" if search_params == ""
    request = search_params.strip.gsub(' ','-').downcase
    response = conn.get("/api/#{request}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_all_plants
    @@get_all_plants ||= JSON.parse(conn.get('allplants').body, symbolize_names: true) 
  end

end
