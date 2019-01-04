require "rails_helper"

describe "Giphy API" do
  it "returns gifs based on forecast data" do
    get "/api/v1/gifs?location=denver,co"

    expect(response).to be_successful
    giphy_array = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(giphy_array).to have_key(:forecast)
    expect(giphy_array[:forecast]).to be_a(Array)
    expect(giphy_array[:forecast][0]).to have_key(:time)
    expect(giphy_array[:forecast][0]).to have_key(:summary)
    expect(giphy_array[:forecast][0]).to have_key(:url)
    expect(giphy_array[:copyright]).to eq("2018")
  end
end
