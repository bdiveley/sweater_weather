class Forecast
  attr_reader :id,
              :current_day,
              :upcoming_days,
              :giphy_days

  def initialize(data)
    @id = 1
    @location = data[:location]
    @datetime = data[:data][:currently][:time]
    @current_day = nil
    @upcoming_days = []
    @giphy_days = []
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

  def copyright
    datetime_format.strftime("%Y")
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

  def load_giphy_days(daily_data, gif_urls)
    combined_data = daily_data.zip(gif_urls)
    combined_data.each do |day|
      @giphy_days << GiphyDay.new(day)
    end
  end

end
