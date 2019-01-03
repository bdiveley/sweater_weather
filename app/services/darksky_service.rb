class DarkskyService

  def initialize(coords)
    @lat = coords[:lat]
    @long = coords[:lng]
  end

  def get_forecast
    conn = Faraday.new("https://api.darksky.net/")

    response = conn.get("forecast/#{ENV['DARKSKY_API_KEY']}/#{lat},#{long}")

    results = JSON.parse(response.body, symbolize_names: true)
  end

private

  def lat
    @lat
  end

  def long
    @long
  end

end
