require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start
require "date"


require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'vcr'
require 'webmock/rspec'

VCR.configure do |config|
  config.ignore_localhost = true
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data("<DARKSKY_API_KEY>") { ENV['DARKSKY_API_KEY'] }
  config.filter_sensitive_data("<GOOGLE_API_KEY>") { ENV['GOOGLE_API_KEY'] }


end

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryBot::Syntax::Methods
  DatabaseCleaner.strategy = :truncation
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

def stub_geocode_request
  stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=#{ENV['GOOGLE_API_KEY']}").to_return(body: File.read("./spec/fixtures/geocode_request.json"))
end

def stub_darksky_forecast_request
  stub_request(:get, "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/39.7392358,-104.990251").to_return(body: File.read("./spec/fixtures/darksky_forecast_request.json"))
end

def stub_favorites_get_request
  stub_request(:get, "/api/v1/favorites?api_key=abc123").to_return(body: File.read("./spec/fixtures/weather_get_favorites_request.json"))
end

def stub_favorites_post_request
  stub_request(:post, "/api/v1/favorites?location=denver,co&api_key=abc123").to_return(body: File.read("./spec/fixtures/weather_post_favorite_request.json"))
end

def stub_favorites_delete_request
  stub_request(:delete, "/api/v1/favorites?location=boulder,co&api_key=abc123").to_return(body: File.read("./spec/fixtures/weather_delete_favorite_request.json"))

end
