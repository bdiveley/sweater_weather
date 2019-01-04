class GiphyService

  def initialize(summary)
    @summary = summary
  end

  def get_json
    conn = Faraday.new("http://api.giphy.com/")
    response = conn.get("v1/gifs/search?api_key=#{ENV['GIPHY_API_KEY']}&q=#{@summary}&limit=1")
    JSON.parse(response.body, symbolize_names: true)
  end

private

end
