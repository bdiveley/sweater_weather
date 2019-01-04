class GiphyDay

  def initialize(data)
    @time = data.first[:time]
    @summary = data.first[:summary]
    @url = data.last
  end
end
