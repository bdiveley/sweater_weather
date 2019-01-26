require "rails_helper"

describe 'Favorite API' do
  it 'user can get their favorites from the database without making an API call' do
    user = create(:user)
    user.add_favorites("denver,co")
    get "/favorites?api_key=#{user.api_key}"

    favorites =JSON.parse(response.body, symbolize_names: true)

    expect(favorites[:data].count).to eq(1)
  end
end
