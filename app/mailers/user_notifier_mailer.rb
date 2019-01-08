class UserNotifierMailer < ApplicationMailer

  def inform(email, location)
    @email = email
    @forecast = ForecastFacade.new(location).forecast
    mail(to: @email, subject: "Here is your forecast for #{location.upcase}")
  end
end
