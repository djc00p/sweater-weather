class CurrentWeather
attr_reader :id,
            :time,
            :summary,
            :icon,
            :temperature,
            :temp_high,
            :temp_low,
            :city,
            :state,
            :country

  def initialize(attribute, address)
    @id = 1
    @time = Time.at(attribute[:currently][:time]).strftime("%I:%M %p, %m/%d")
    @summary = attribute[:currently][:summary]
    @icon = attribute[:currently][:icon]
    @temperature = attribute[:currently][:temperature].to_i
    @temp_high = attribute[:daily][:data][0][:temperatureHigh].to_i
    @temp_low = attribute[:daily][:data][0][:temperatureLow].to_i
    @city = address[0][:long_name]
    @state = address[2][:short_name]
    @country = address[3][:long_name]
  end
end
