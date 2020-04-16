class CalendarService

  def self.post_events(user, title, description, date)
    response = conn.post('event/new?') do |req|
      req.params['token'] = user.google_token
      req.params['refresh_token'] = user.google_refresh_token
      req.params['calendar_id'] = user.calendar_id
      req.params['name'] = title
      req.params['description'] = description
      req.params['date'] = date
    end
    return 0 unless JSON.parse(response.body, symbolize_names: true).empty?
  end

  def self.create_calendar(user, calendar_name)
    response = conn.post('calendar/new?') do |req|
      req.params['token'] = user.google_token
      req.params['refresh_token'] = user.google_refresh_token
      req.params['calendar_name'] = calendar_name
    end
    result = JSON.parse(response.body, symbolize_names: true)
    user.calendar_id = result[:id]
    user.save
  end

  def self.list_calendars(user)
    response = conn.get('calendar/info?') do |req|
      req.params['token'] = user.google_token
      req.params['refresh_token'] = user.google_refresh_token
    end
    result = JSON.parse(response.body, symbolize_names: true)
  end

  private 

  def self.conn
    Faraday.new 'https://notificationmicroservice.herokuapp.com'
  end

end