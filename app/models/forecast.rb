class Forecast
  attr_reader :location,
              :datetime,
              :current_day,
              :upcoming_days

  def initialize(location, data)
    @location = format_location(location)
    @datetime = format_time(data[:currently][:time])
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

  def format_time(time)
    Time.at(time).strftime("%m-%d-%Y, %I:%M")
  end

  def format_location(location)
    location.split(",").map do |word|
      if word.length > 2
        word.titleize
      else
        word.upcase
      end
    end.join(",")
  end
end
