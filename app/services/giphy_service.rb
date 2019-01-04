class GiphyService

  def initialize(summary)
    @summary = summary
  end

  def get_json
    conn = Faraday.new("http://api.giphy.com/")
    response = conn.get("v1/gifs/search?api_key=#{ENV['GIPHY_API_KEY']}&q=#{@summary}")
  end

private

end
