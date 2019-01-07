class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :location, :time, :date, :current_day, :upcoming_days

  attribute :location do |object|
    object.location.split(",").map do |word|
      if word.length > 2
        word.titleize
      else
        word.upcase
      end
    end.join(", ")
  end

  attribute :time do |object|
    object.datetime.strftime('%I:%M')
  end

  attribute :date do |object|
    object.datetime.strftime("%m-%d-%Y")
  end

end
