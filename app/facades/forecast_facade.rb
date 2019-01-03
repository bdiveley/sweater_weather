class ForecastFacade
  attr_reader :id

  def initialize(location)
    @id = 1
    @location = location
    @coords = nil
    @forecast_results = nil
  end

  def get_forecast
    @forecast_results ||= darksky_service(get_coords).get_json
    Forecast.new(@forecast_results)
  end

  def location
    @location.split(",").map do |word|
      if word.length > 2
        word.titleize
      else
        word.upcase
      end
    end.join(", ")
  end

private

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
