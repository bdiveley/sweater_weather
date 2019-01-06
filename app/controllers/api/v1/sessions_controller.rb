class Api::V1::SessionsController < ApplicationController

  def create
    if current_user.authenticate(params[:password])
      session[:user_id] = current_user.id
      render json: UserSerializer.new(current_user)
    else
      render body: "Unauthorized", status: 401
    end
  end

private

  def current_user
    @user ||= User.find_by(email: params[:email])
  end

end
