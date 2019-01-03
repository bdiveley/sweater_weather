class Forecast
  attr_reader :id

  def initialize(location)
    @id = 1
    @location = location
    @coords = nil
    @forecast_results = nil
  end

  def get_coords
    @coords ||= geocode_service.get_json[:results][0][:geometry][:location]
  end

  def get_forecast
    @forecast_results ||= darksky_service(get_coords).get_json
  end

  def location
    @location.titleize
  end

private

  def geocode_service
    GeocodingService.new(@location)
  end

  def darksky_service(coords)
    DarkskyService.new(coords)
  end

end
