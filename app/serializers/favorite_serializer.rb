class FavoriteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :current_weather

  attribute :location do |object|
    object.location.split(",").map do |word|
      if word.length > 2
        word.titleize
      else
        word.upcase
      end
    end.join(", ")
  end

  attribute :current_weather do |object|
    current_day = object.current_weather.current_day
    datetime = object.current_weather.datetime
    {datetime: datetime, current_day: current_day}
  end

end
