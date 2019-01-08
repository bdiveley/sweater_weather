class FavoriteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :current_weather

  attribute :current_weather do |object|
    current_day = object.current_weather.current_day
    datetime = object.current_weather.datetime
    {
      datetime: datetime,
      current_day: current_day
    }
  end

end
