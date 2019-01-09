class MailersController < ApplicationController

  def create
    #two options to send mailers - through mailer or background worker 
    # UserNotifierMailer.inform(params[:email], params[:location]).deliver_now
    ForecastSenderJob.perform_later(params[:email], params[:location])
    render body: "Email Sent", status: 200
  end
end
