require 'rails_helper'

describe 'Forecast API' do
  it 'returns forecast data' do
    # stub_geocode_request
    # stub_darksky_forecast_request

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    forecast = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(forecast[:id]).to eq("1")
    expect(forecast[:attributes][:location]).to eq("Denver, CO")
    expect(forecast[:attributes]).to have_key(:current_day)
    expect(forecast[:attributes][:current_day]).to have_key(:hourly)
    expect(forecast[:attributes]).to have_key(:upcoming_days)
  end
end
