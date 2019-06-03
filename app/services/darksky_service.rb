class DarkskyService
  def initialize(location)
    @location = location
  end

  def weather
    get_json
  end

  def hourly
    get_json[:hourly][:data]
  end

  def daily
    get_json[:daily][:data]
  end

  private

  def conn
    Faraday.new('https://api.darksky.net/forecast/') do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def get_json
    response = conn.get("#{ENV['DARK_SKY_API']}/#{@location[:lat]},#{@location[:lng]}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
