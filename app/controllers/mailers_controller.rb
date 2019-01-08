class MailersController < ApplicationController

  def create
    ForecastSenderJob.perform_later(params[:email], params[:location])
    render body: "Email Sent", status: 200
  end
end
