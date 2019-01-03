class Forecast
  attr_reader :id

  def initialize(location, data)
    @id = 1
    @location = location
    @time = data[:currently][:time]
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
    #add logic here to format the time
  end

  def current_day
    #create day object and grab relevant info
    #this day will have an array of hourly objects
  end

  def upcoming_days
    #create an array of day objects
    #these will not have hourly ojects
  end

end
