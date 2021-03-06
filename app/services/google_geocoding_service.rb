class GoogleGeocodingService
  def initialize(forecast_params)
    @city_state = forecast_params
  end

  def address
    get_json[:address_components]
  end

  def location
    get_json[:geometry][:location]
  end

private

  def get_json
    response ||= conn.get
    data = JSON.parse(response.body, symbolize_names: true)
    data[:results][0]
  end

  def conn
    Faraday.new('https://maps.googleapis.com/maps/api/geocode/json?') do |f|
      f.params['key'] = ENV['GOOGLE_API']
      f.params['address'] = @city_state
      f.adapter Faraday.default_adapter
    end
  end
end
