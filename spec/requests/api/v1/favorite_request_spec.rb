require "rails_helper"

describe "favorite API request" do
  it "can create a new user favorite location" do
    user = User.create(email: "test@gmail.com", password: "test", api_key: "abc123")
    post "/api/v1/favorites?api_key=abc123"

    key = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(key[:data][:attributes]).to have_key(:api_key)
  end
  # it "cannot create a new user favorite location if api_key is inaccurate" do
  #   user = User.create(email: "test@gmail.com", password: "test", api_key: "abc123")
  #   post "/api/v1/favorites?api_key=xyz123"
  #
  #   expect(response.status_code).to eq(401)
  # end
end
