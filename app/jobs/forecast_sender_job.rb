class ForecastSenderJob < ApplicationJob
  queue_as :default

  def perform(email, location)
    UserNotifierMailer.inform(email, location).deliver_now
  end
end
