require "rails_helper"

describe "Giphy Service API" do
  it "exists" do
    summary = "It's going to be a sunny one!"
    giphy = GiphyService.new(summary)
    expect(giphy).to be_a(GiphyService)
  end
  it 'returns giphy data' do
    # VCR.user_cassette("giphy_results_cassette") do
      summary = "It's going to be a sunny one!"
      giphy = GiphyService.new(summary)

      data = giphy.get_json

      expect(data).to be_a(Hash)
      expect(data[:data].first).to have_key(:url)
    # end 
  end
end
