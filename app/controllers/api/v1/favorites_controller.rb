class Api::V1::FavoritesController < ApplicationController

  def create
    if current_user
      @favorite = current_user.add_favorites(params[:location])
      render json: FavoriteSerializer.new(@favorite)
    else
      render body: 'Unauthorized', status: 401
    end
  end

  def index
    if current_user
      @favorites = current_user.favorites
      render json: FavoriteSerializer.new(@favorites)
    else
      render body: "Unauthorized", status: 401
    end
  end

private

  def current_user
    @user ||= User.find_by(api_key: params[:api_key])
  end

end
