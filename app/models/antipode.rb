class Antipode
  attr_accessor :id
  def initialize(location)
    @id = 1
    @location = location[:loc]
  end


  def location_name
    locate_antipode[:address_components][1][:long_name]
  end

  def forecast
    AntipodeForecast.new(darksky_service.weather)
  end

  def search_location
    @location
  end

  private

  def antipode_service
    @_antipode_service ||= AntipodeService.new(google_service(@location))
  end

  def google_service(location)
    @_google_service ||= GoogleGeocodingService.new(location).location
  end

  def darksky_service
    @_forecast_service ||= DarkskyService.new(locate_antipode[:geometry][:location])
  end

  def locate_antipode
    ReverseGeocodingService.new(antipode_service.antipode_json).antipode
  end
end
