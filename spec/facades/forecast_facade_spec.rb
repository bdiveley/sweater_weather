require "rails_helper"

describe "Forecast Facade" do
  it "formats the forecast location" do
    facade = ForecastFacade.new("denver,co")

    expect(facade.location).to eq("Denver, CO")
  end
  it "create a new forecast object" do
    stub_geocode_request
    stub_darksky_forecast_request
    facade = ForecastFacade.new("denver,co")

    expect(facade.get_forecast).to be_a(Forecast)
  end
end
