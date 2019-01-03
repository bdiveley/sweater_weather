class DarkskyService

  def initialize(coords)
    @lat = coords[:lat]
    @long = coords[:lng]
  end

  def get_json
    JSON.parse(response.body, symbolize_names: true)
  end

private

  def lat
    @lat
  end

  def long
    @long
  end

  def conn
    Faraday.new("https://api.darksky.net/")
  end

  def response
    conn.get("forecast/#{ENV['DARKSKY_API_KEY']}/#{lat},#{long}")
  end

end
