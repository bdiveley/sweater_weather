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
      @forecast = Forecast.new({location: location, data: data})
    end
  it "exists" do
    expect(@forecast).to be_a(Forecast)
  end
  it "formats the forecast location" do
    expect(@forecast.location).to eq("Denver, CO")
  end
  it 'formats the forecast time' do
    expect(@forecast.time).to eq("08:38")
  end
  it 'formats the forecast date' do
    formatted = @forecast.date
    expect(formatted.to_s).to eq("01-02-2019")
  end
end
