require "rails_helper"

describe "forecast" do
  before(:each) do
    location = 'denver,co'
    data = {
      "latitude": 39.7392358,
      "longitude": -104.990251,
      "timezone": "America/Denver",
      "currently": {
        "time": 1546486738,
        "summary": "Clear",
        "icon": "clear-night" }
      }
      @forecast = Forecast.new(location, data)
    end
  it "exists" do
    expect(@forecast).to be_a(Forecast)
  end
end
