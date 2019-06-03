class HourlyWeather
  attr_reader :id,
              :time,
              :icon,
              :temperature

  def initialize(attribute)
    @time = Time.at(attribute[:time]).strftime("%I %p")
    @icon = attribute[:icon]
    @temperature = attribute[:temperature].to_i
  end
end
