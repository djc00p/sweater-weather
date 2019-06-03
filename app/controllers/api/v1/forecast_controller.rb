class Api::V1::ForecastController < ApplicationController
  def index
    forecast = Forecast.new(forecast_params)
    render json: CurrentWeatherSerializer.new(forecast)
  end

  private

  def forecast_params
    params.permit(:location)
  end
end
