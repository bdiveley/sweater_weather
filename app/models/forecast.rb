class Forecast
  attr_reader :id,
              :location,
              :datetime,
              :current_day,
              :upcoming_days

  def initialize(location, data)
    @id = 1
    @location = location
    @datetime = Time.at(data[:currently][:time])
    @current_day = nil
    @upcoming_days = []
  end

  def load_today(all_data)
    @current_day ||= CurrentDay.new(all_data)
    @current_day.load_hourly(all_data[:hourly][:data][0..7])
    @current_day
  end

  def load_upcoming_days(daily_data)
    daily_data.map do |daily|
      @upcoming_days << FutureDay.new(daily)
    end
  end
end
