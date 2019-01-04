class Api::V1::GifsController < ApplicationController

  def index
    @forecast = ForecastFacade.new(params[:location]).get_giphy_forecast
    render json: GiphyForecastSerializer.new(@forecast)
  end
end
