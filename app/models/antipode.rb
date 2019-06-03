class Antipode

  def initialize(location)
    @location = location[:loc]
  end


  def antipode_city
    locate_antipode
  end

  private

  def antipode_service
    @_antipode_service ||= AntipodeService.new(google_service(@location).location).antipode_location
  end

  def google_service(location)
    @_google_service ||= GoogleGeocodingService.new(location)
  end

  def locate_antipode
    binding.pry
    ReverseGeocodingService.new(antipode_service).antipode
  end
end
