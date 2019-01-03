class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :location, :date, :time, :current_day
end
