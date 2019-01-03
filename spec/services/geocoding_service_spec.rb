require "rails_helper"

describe "google geocoding service" do
  it "exists" do
    service = GeocodingService.new("denver,co")

    expect(service).to be_a(GeocodingService)
  end
  it "returns lat,long for a given location" do
    service = GeocodingService.new("denver,co")

    coords = service.get_json[:results][0][:geometry][:location]

    expect(coords).to eq({lat: 39.7392358, lng: -104.990251})
  end
end
