class GiphyForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :giphy_days, :copyright
end
