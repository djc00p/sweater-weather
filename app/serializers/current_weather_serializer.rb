class CurrentWeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :current_forecast, :current_forecast_details, :hourly_forecast, :daily_forecast
end
