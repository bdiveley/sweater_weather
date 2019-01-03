class Api::V1::ForecastController < ApplicationController

  def show
    @facade = ForecastFacade.new(params[:location])
    @facade.get_forecast
    render json: ForecastSerializer.new(@facade)
  end

end
