class Unsplash
  def initialize(location)
    @location = location
  end

  def background_image
    get_json[:urls][:regular]
  end


private

  def conn
    Faraday.new('https://api.unsplash.com/search/photos') do |f|
      f.params[:client_id] = ENV['UNSPLASH_API_KEY']
      f.params[:query] = @location
      f.adapter Faraday.default_adapter
    end
  end

  def get_json
    response = conn.get
    data = JSON.parse(response.body, symbolize_names: true)
    data[:results].sample(1)
  end
end
