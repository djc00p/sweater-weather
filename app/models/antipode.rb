class Antipode

  def initialize(location)
    @location = location[:loc]
  end


  def antipode_city
    conn = Faraday.new('http://amypode.herokuapp.com/api/v1/antipodes') do |f|
      f.headers[:api_key] = ENV['ANTIPODE_KEY']
      f.params[:loc] = @location
      f.adapter Faraday.default_adapter
    end

    response = conn.get

    data = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end
end
