require "rails_helper"

describe "favorite API request" do
  it "can create a new user favorite location" do
    stub_favorites_post_request
    stub_geocode_request
    stub_darksky_forecast_request

    user = create(:user)
    post "/api/v1/favorites?location=denver,co&api_key=abc123"

    key = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(key[:data][:attributes]).to have_key(:location)
  end
  it "cannot create a new user favorite location if api_key is inaccurate" do
    stub_favorites_post_request
    stub_geocode_request
    stub_darksky_forecast_request

    user = create(:user)
    post "/api/v1/favorites?location=denver,co&api_key=xyz123"

    expect(response.status).to eq(401)
    expect(response.body).to eq("Unauthorized")
  end
  it "cannot create a new user favorite location if location is already a favorite" do
    stub_favorites_post_request
    stub_geocode_request
    stub_darksky_forecast_request

    user = create(:user)
    user.add_favorites("denver,co")
    post "/api/v1/favorites?location=denver,co&api_key=abc123"

    expect(response).to be_successful
    expect(user.favorites.count).to eq(1)
  end
  it "can return all users favorites" do
    stub_geocode_request
    stub_darksky_forecast_request
    stub_favorites_get_request

    user = create(:user)
    user.add_favorites("denver,co")

    get "/api/v1/favorites?api_key=abc123"

    results = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(response).to be_successful
    expect(results).to be_a(Array)
    expect(results[0][:attributes]).to have_key(:location)
    expect(results[0][:attributes]).to have_key(:current_weather)
  end
end
