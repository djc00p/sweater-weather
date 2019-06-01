class Api::V1::ForecastController < ApplicationController
  def index

    render json: Forecast.new(forecast_params).city_weather
    binding.pry
  end

  private

  def forecast_params
    params.permit(:location)
  end
end
