class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :location
end
