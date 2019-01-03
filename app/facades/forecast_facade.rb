class ForecastFacade

  def initialize(location)
    @location = location
    @coords = nil
    @forecast_results = nil
  end

  def get_forecast
    @forecast_results ||= darksky_service(get_coords).get_json
    forecast = Forecast.new(@location, @forecast_results)
    load_forecast_days(forecast)
  end

private

  def load_forecast_days(forecast)
    forecast.load_today(@forecast_results)
    forecast.load_upcoming_days(@forecast_results[:daily][:data][1..6])
    forecast
  end

  def get_coords
    @coords ||= geocode_service.get_json[:results][0][:geometry][:location]
  end

  def geocode_service
    GeocodingService.new(@location)
  end

  def darksky_service(coords)
    DarkskyService.new(coords)
  end
end
