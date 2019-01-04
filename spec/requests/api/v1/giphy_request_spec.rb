require "rails_helper"

describe "Giphy API" do
  it "returns giphy_days based on forecast data" do
    get "/api/v1/gifs?location=denver,co"

    expect(response).to be_successful
    giphy_days = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(giphy_days[:type]).to eq("giphy_forecast")
    expect(giphy_days[:attributes][:giphy_days][0]).to have_key(:time)
    expect(giphy_days[:attributes][:giphy_days][0]).to have_key(:summary)
    expect(giphy_days[:attributes][:giphy_days][0]).to have_key(:url)
    expect(giphy_days[:attributes][:copyright]).to eq("2019")
  end
end
