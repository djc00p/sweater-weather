class Antipode

  def initialize(location)
    @location = location[:loc]
  end


  def antipode_city
    binding.pry
    google_service(@location)
  end

  private

  def anitpode_service
    @_antipode_service ||= AntipodeService.new(@location).antipode_location
  end

  def google_service(location)
    @_google_service ||= GoogleGeocodingService.new(location)
  end

  def locate_antipode
    google_service(@location)
  end
end
