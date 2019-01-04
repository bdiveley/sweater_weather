class Api::V1::UsersController < ApplicationController

  def create
    @user = User.create(new_user_info) if verify_password
    render json: UserSerializer.new(@user)
  end

private

  def user_params
    params.permit(:email, :password)
  end

  def new_user_info
    key = {api_key: User.generate_key}
    user_params.merge(key)
  end

  def verify_password
    params[:password] == params[:password_confirmation]
  end

end
