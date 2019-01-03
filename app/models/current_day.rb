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
    @hourly = nil
  end

  def load_hourly(hourly_data)
    # @hourly ||= hourly_data.each do |hour|
    #   next_hour = Hour.new(hour)
    #   @hourly << next_hour
    # end
  end

end