class DailyWeather
attr_reader :id,
            :time,
            :icon,
            :precipType,
            :precipProbability,
            :temperatureHigh,
            :temperatureLow

  def initialize(attribute)
    @time = Time.at(attribute[:time]).strftime("%A")
    @icon = attribute[:icon]
    @precipType = attribute[:precipType]
    @precipProbability = (attribute[:precipProbability] * 100).to_i
    @temp_high = attribute[:temperatureHigh].to_i
    @temp_low = attribute[:temperatureLow].to_i
  end
end
