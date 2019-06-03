class AntipodeService
  def initialize(location)
    @location = location
  end

  def antipode_location
    get_json
  end

  def conn
    Faraday.new('http://amypode.herokuapp.com/api/v1/antipodes') do |f|
      f.headers[:api_key] = ENV['ANTIPODE_KEY']
      f.params[:lat] = @location[:lat]
      f.params[:long] = @location[:lng]
      f.adapter Faraday.default_adapter
    end
  end

  def get_json
    response = conn.get

    JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
  end
end
