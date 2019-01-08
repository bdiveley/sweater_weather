require "rails_helper"

describe "Forecast Facade" do
  it "create a new forecast object" do
    stub_geocode_request
    stub_darksky_forecast_request
    location = "denver,co"
    facade = ForecastFacade.new(location)

    expect(facade.forecast).to be_a(Forecast)
  end
end
