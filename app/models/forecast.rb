class Forecast
  def initialize(forecast_params)
    @forecast_params = forecast_params
  end

  def city_weather
    location ||= GoogleGeocoding.new(@forecast_params).location

    conn = Faraday.new('https://api.darksky.net/forecast/') do |f|
      f.adapter Faraday.default_adapter
    end
    response = conn.get("#{ENV['DARK_SKY_API']}/#{location[:lat]},#{location[:lng]}")

    data = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end
end
