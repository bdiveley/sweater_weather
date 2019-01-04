require "rails_helper"

describe 'User API' do
  it 'creates a user with api-key' do
    post "/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password"

    expect(User.all.count).to eq(1)
    expect(User.all.last.api_key).to be_a(String)
  end
  it 'does not create a user if passwords do not match' do
    post "/api/v1/users?email=whatever@example.com&password=password&password_confirmation=nope"

    expect(User.all.count).to eq(0)
  end
  it 'returns an api_key' do
    post "/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password"
    expect(response).to be_successful
    key = JSON.parse(response.body, symbolize_names: true)

    expect(key).to be_a(Hash)
    expect(key[:data][:attributes]).to have_key(:api_key)
  end
end
