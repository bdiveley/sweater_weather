class Forecast
  attr_reader :id,
              :current_day,
              :upcoming_days

  def initialize(location, data)
    @id = 1
    @location = location
    @datetime = data[:currently][:time]
    @current_day = nil
    @upcoming_days = []
  end

  def location
    @location.split(",").map do |word|
      if word.length > 2
        word.titleize
      else
        word.upcase
      end
    end.join(", ")
  end

  def time
    datetime_format.strftime('%I:%M')
  end

  def date
    datetime_format.strftime("%m-%d-%Y")
  end

  def datetime_format
    Time.at(@datetime)
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
