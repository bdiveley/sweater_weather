class FavoriteFacade < ForecastFacade

  def get_forecast(location)
    forecast = Forecast.new(location, forecast_results)
    forecast.load_today(forecast_results)
    forecast
  end


end
