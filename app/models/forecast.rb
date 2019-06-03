class Forecast
  attr_reader :id
  def initialize(forecast_params)
    @forecast_params = forecast_params
    @id = 1
  end

  def current_forecast
    CurrentWeather.new(darksky_service.weather, google_service.address)
  end

  def current_forecast_details
    CurrentWeatherDetails.new(darksky_service.weather)
  end

  def hourly_forecast
    darksky_service.hourly.map do |hour|
      HourlyWeather.new(hour)
    end
  end

  def daily_forecast
    darksky_service.daily.drop(1).map do |day|
      DailyWeather.new(day)
    end
  end

  private

  def darksky_service
    @_forecast_service ||= DarkskyService.new(google_service.location)
  end

  def google_service
    @_location_service ||= GoogleGeocodingService.new(@forecast_params)
  end
end
