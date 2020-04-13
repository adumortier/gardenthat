class PlantService
  def conn
    conn = Faraday.new "https://plantmicroservice.herokuapp.com/api/"
  end

  def get_search_info(search_param)
    request = search_param.strip.gsub(' ','-')
    response = conn.get(request)
    JSON.parse(response.body, symbolize_names: true)
  end
end
