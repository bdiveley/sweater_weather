class Hour

  def initialize(data)
    @time = Time.at(data[:time]).strftime('%I:%M')
    @temperature = data[:temperature]
    @icon = data[:icon]
  end

end
