class MailersController < ApplicationController

  def create
    UserNotifierMailer.inform(params[:email], params[:location]).deliver_now
    # ForecastSenderJob.perform_later(params[:email], params[:location])
    render body: "Email Sent", status: 200
  end
end
