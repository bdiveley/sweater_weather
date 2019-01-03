require "date"

class Forecast
  attr_reader :id, :current_day

  def initialize(location, data)
    @id = 1
    @location = location
    @datetime = data[:currently][:time]
    @current_day = nil
    @upcoming_days = nil
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
    formatted = DateTime.strptime("#{@datetime}", '%s')
    (formatted.to_time - 7.hours).to_datetime
  end

  def load_today(data)
    @current_day ||= CurrentDay.new(data)
    @current_day.load_hourly(data[:hourly][:data][0..7])
    @current_day
  end

  def upcoming_days
    #create an array of day objects
    #these will not have hourly ojects
  end

end
