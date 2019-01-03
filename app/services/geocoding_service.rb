class GeocodingService

  def initialize(location)
    @location = location
  end

  def get_coords
    conn = Faraday.new("https://maps.googleapis.com/maps/api/geocode/")

    response = conn.get("json?address=#{location}&key=#{ENV['GOOGLE_API_KEY']}")

    parsed = JSON.parse(response.body, symbolize_names: true)[:results][0][:geometry][:location]
  end

private

  def location
    @location
  end

end
