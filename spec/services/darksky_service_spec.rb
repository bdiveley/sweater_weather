require "rails_helper"

describe "dark sky service" do
  before(:each) do
    @coords = {:lat=>39.7392358, :lng=>-104.990251}
    @service = DarkskyService.new(@coords)

  end
  it "exists" do
    expect(@service).to be_a(DarkskyService)
  end
  it "it returns forecast data" do
    forecast = @service.get_forecast

    expect(forecast).to be_a(Hash)
    expect(forecast[:latitude]).to eq(@coords[:lat])
    expect(forecast[:longitude]).to eq(@coords[:lng])
    expect(forecast[:timezone]).to match("/Denver")
  end
end
