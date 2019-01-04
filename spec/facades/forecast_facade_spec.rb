require "rails_helper"

describe "Forecast Facade" do
  it "create a new forecast object" do
    stub_geocode_request
    stub_darksky_forecast_request
    facade = ForecastFacade.new({location: "denver,co"})

    expect(facade.get_forecast).to be_a(Forecast)
  end
end
