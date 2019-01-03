class Api::V1::ForecastController < ApplicationController

  def show
    @forecast = Forecast.new(params[:location])
    @forecast.location
    @forecast.get_forecast
    render json: ForecastSerializer.new(@forecast)
  end

end
