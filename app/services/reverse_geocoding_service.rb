class ReverseGeocodingService
  def initialize(lat_lng)
    @lat = lat_lng[:lat]
    @lng = lat_lng[:long]
  end

  def antipode
    get_json
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
      f.params['latlng'] = "#{@lat},#{@lng}"
      f.adapter Faraday.default_adapter
    end
  end
end
