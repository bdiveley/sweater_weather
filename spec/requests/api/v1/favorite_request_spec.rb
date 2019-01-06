require "rails_helper"

describe "favorite API request" do
  it "can create a new user favorite location" do
    user = create(:user)
    post "/api/v1/favorites?location=denver,co&api_key=abc123"

    key = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(key[:data][:attributes]).to have_key(:location)
  end
  it "cannot create a new user favorite location if api_key is inaccurate" do
    user = User.create(email: "test@gmail.com", password: "test", api_key: "abc123")
    post "/api/v1/favorites?location=denver,co&api_key=xyz123"

    expect(response.status).to eq(401)
    expect(response.body).to eq("Unauthorized")
  end
  it "cannot create a new user favorite location if location is already a favorite" do
    user = User.create(email: "test@gmail.com", password: "test", api_key: "abc123")
    user.add_favorites("denver,co")
    post "/api/v1/favorites?location=denver,co&api_key=abc123"

    expect(response).to be_successful
    expect(user.favorites.count).to eq(1)
  end
end
