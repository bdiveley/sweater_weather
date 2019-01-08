class ForecastFacade
  attr_reader :id

  def initialize(location)
    @id = 1
    @location = location
    @coords = nil
    @forecast_results = nil
  end

  def forecast
    forecast = Forecast.new(@location, forecast_results)
    load_current_days(forecast)
    load_upcoming_days(forecast)
    forecast
  end

private

  def forecast_results
    @forecast_results ||= darksky_service(get_coords).get_json
  end

  def load_current_days(forecast)
    forecast.load_today(forecast_results)
    forecast
  end

  def load_upcoming_days(forecast)
    forecast.load_upcoming_days(forecast_results[:daily][:data][1..6])
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
