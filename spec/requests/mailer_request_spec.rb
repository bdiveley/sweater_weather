require "rails_helper"

describe "Mailers Request" do

  it 'can send an email with forecast info' do
    stub_geocode_request
    stub_darksky_forecast_request
    post "/mailers?email=#{ENV['EMAIL_ADDRESS']}&location=denver,co"
  end
end
