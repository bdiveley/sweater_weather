class ForecastSenderJob < ApplicationJob
  queue_as :default

  def perform(email, location)
    UserNotifierMailer.send_forecast_email(email, location).deliver_now
  end
end
