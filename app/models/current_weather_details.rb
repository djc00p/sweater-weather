class CurrentWeatherDetails
attr_reader :id,
            :hourly_summary,
            :daily_summary,
            :icon,
            :summary,
            :uvIndex,
            :humidity,
            :visibility,
            :feels_like

  def initialize(attribute)
    @id = 1
    @hourly_summary = attribute[:hourly][:summary]
    @daily_summary = attribute[:daily][:data][0][:summary]
    @icon = attribute[:currently][:icon]
    @summary = attribute[:currently][:summary]
    @uvIndex = attribute[:currently][:uvIndex]
    @humidity = (attribute[:currently][:humidity] * 100).to_i
    @visibility = attribute[:currently][:visibility]
    @feels_like = attribute[:currently][:apparentTemperature].to_i
  end
end
