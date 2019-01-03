class FutureDay

  def initialize(data)
    @day_of_week = data[:time]
    @summary = data[:summary]
    @icon = data[:icon]
    @chance_of_precip = data[:precipProbability]
    @high_temp = data[:temperatureHigh]
    @low_temp = data[:temperatureLow]
  end

end
