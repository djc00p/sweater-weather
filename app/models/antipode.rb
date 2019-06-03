class Antipode

  def initialize(location)
    @location = location[:loc]
  end


  def antipode_city
    locate_antipode
  end

  private

  def antipode_service(location)
    @_antipode_service ||= AntipodeService.new(location).antipode_location
  end

  def google_service(location)
    @_google_service ||= GoogleGeocodingService.new(location)
  end

  def locate_antipode
    lat_lng = google_service(@location).location
    anitpode_lat_lon = antipode_service(lat_lng)
    
    binding.pry
  end
end
