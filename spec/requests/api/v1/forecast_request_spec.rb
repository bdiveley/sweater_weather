require 'rails_helper'

describe 'Forecast API' do
  it 'returns forecast data' do
    stub_geocode_request
    stub_darksky_forecast_request
    
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    forecast = JSON.parse(response.body)
    #add more data here as I build out the response I want from Dark Sky
  end
end
