class ForecastFacade

  def initialize(location)
    @location = location
    @coords = nil
    @forecast_results = nil
    @giphy_forecast_results = []
  end

  #Next Steps:  this facade is getting a bit lengthy, would consider adding a separate GiphyForecastFacade

  def get_giphy_forecast
    get_giphy_service_results(get_forecast_results)
    load_giphy_forecast_days(create_forecast)
  end

  def get_forecast
    get_forecast_results
    load_forecast_days(create_forecast)
  end

private

  def create_forecast
    Forecast.new({location: @location, data: @forecast_results})
  end

  def get_giphy_service_results(results)
    results[:daily][:data].map do |daily|
      @giphy_forecast_results << giphy_service(daily[:summary]).get_json[:data][0][:url]
    end
  end

  def load_giphy_forecast_days(forecast)
    forecast.load_giphy_days(@forecast_results[:daily][:data][0..9], @giphy_forecast_results)
    forecast
  end

  def get_forecast_results
    @forecast_results ||= darksky_service(get_coords).get_json
  end

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

  def giphy_service(summary)
    GiphyService.new(summary)
  end
end
