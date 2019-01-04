class Api::V1::UsersController < ApplicationController

  def create
    if verify_password
      key = {api_key: generate_key}
      @user = User.create(user_params.merge(key))
      render json: UserSerializer.new(@user)
    end
  end

private

  def user_params
    params.permit(:email, :password)
  end

  def verify_password
    params[:password] == params[:password_confirmation]
  end

  def generate_key
    SecureRandom.hex(27)
  end
end
