class Api::V1::GifsController < ApplicationController

  def index
    @forecast = ForecastFacade.new(params[:location]).get_forecast
    #render json: GifphyForecastSerializer.new(@forecast)

  end
end
