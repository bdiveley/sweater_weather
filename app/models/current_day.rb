class CurrentDay

  def initialize(data)
    @summary = data[:currently][:summary]
    @icon = data[:currently][:icon]
    @current_temp = data[:currently][:temperature]
    @high_temp = data[:daily][:data][0][:temperatureHigh]
    @low_temp = data[:daily][:data][0][:temperatureLow]
    @apparent_temp = data[:currently][:apparentTemperature]
    @humidity = data[:currently][:humidity]
    @visibility = data[:currently][:visibility]
    @uv_index = data[:currently][:uvIndex]
    @today_description = data[:daily][:data][0][:summary]
    @hourly_data = []
  end

  def load_hourly(hourly_data)
    hourly_data.map do |hour|
      @hourly_data << Hour.new(hour)
    end
  end

end
