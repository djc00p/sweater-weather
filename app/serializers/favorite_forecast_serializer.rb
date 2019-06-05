class FavoriteForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :current_forecast, :current_forecast_details, :hourly_forecast, :daily_forecast
end
