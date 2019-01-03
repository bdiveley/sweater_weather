class GeocodingService

  def initialize(location)
    @location = location
  end

  def get_coords
    JSON.parse(response.body, symbolize_names: true)[:results][0][:geometry][:location]
  end

private

  def location
    @location
  end

  def conn
    Faraday.new("https://maps.googleapis.com/maps/api/geocode/")
  end

  def response
    conn.get("json?address=#{location}&key=#{ENV['GOOGLE_API_KEY']}")
  end

end
