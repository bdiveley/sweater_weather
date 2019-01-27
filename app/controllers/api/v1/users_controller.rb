class Api::V1::UsersController < ApplicationController

  def create
    if verify_password
      @user = User.create(new_user_info)
      render json: UserSerializer.new(@user)
    else
      render body: "Unauthorized", status: 401
    end
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
