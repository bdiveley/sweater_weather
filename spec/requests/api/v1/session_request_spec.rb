require "rails_helper"

describe "Session Request API" do
  it "returns a user's api in the response" do
    user = create(:user)
    post "/api/v1/sessions?email=sample@gmail.com&password=test"

    expect(response).to be_successful
    key = JSON.parse(response.body, symbolize_names: true)
    expect(key).to be_a(Hash)
    expect(key[:data][:attributes]).to have_key(:api_key)
  end
  it "does not return a user's api in the response if password is wrong" do
    user = create(:user)
    post "/api/v1/sessions?email=sample@gmail.com&password=wrong"

    expect(response.body).to eq("Unauthorized")
    expect(response.status).to eq(401)
  end
end
