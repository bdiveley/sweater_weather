class FutureDay

  def initialize(data)
    @day_of_week =  Time.at(data[:time]).strftime('%A')
    @summary = data[:summary]
    @icon = data[:icon]
    @chance_of_precip = data[:precipProbability]
    @high_temp = data[:temperatureHigh]
    @low_temp = data[:temperatureLow]
  end

end
