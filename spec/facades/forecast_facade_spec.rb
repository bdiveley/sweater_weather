require "rails_helper"

describe "Forecast Facade" do
  it "formats the forecast location" do
    facade = ForecastFacade.new("denver,co")

    expect(facade.location).to eq("Denver, CO")
  end
end
