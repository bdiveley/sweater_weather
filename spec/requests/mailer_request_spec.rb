require "rails_helper"

describe "Mailers Request" do

  it 'can send an email with forecast info' do
    stub_geocode_request
    stub_darksky_forecast_request
    post "/mailers?email=#{ENV['EMAIL_ADDRESS']}&location=denver,co"

    mail = ActionMailer::Base.deliveries

    expect(mail.count).to eq(1)
    expect(mail.first.body.encoded).to match("Thanks for requesting a forecast!")
  end
end
