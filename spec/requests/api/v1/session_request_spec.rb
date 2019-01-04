require "rails_helper"

describe "Session Request API" do
  it "creates a current_user" do
    user = User.create(email: "whatever@example.com", password: "password", api_key: "123abc")
    post "/api/v1/sessions?email=whatever@example.com&password=password"

    # expect(current_user).to eq(user)
  end
  it "does not create a current_user" do
    user = User.create(email: "whatever@example.com", password: "password", api_key: "123abc")
    post "/api/v1/sessions?email=whatever@example.com&password=password"

    # expect(current_user).to eq(nil)
  end
  it "returns a user's api in the response" do

  end
end
