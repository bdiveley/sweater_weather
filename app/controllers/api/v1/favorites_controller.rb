class Api::V1::FavoritesController < ApplicationController

  def create
    if current_user
      render json: FavoriteSerializer.new(add_favorite)
    else
      unauthorized
    end
  end

  def index
    if current_user
      render json: FavoriteSerializer.new(user_favorites)
    else
      unauthorized
    end
  end

  def destroy
    if current_user
      find_favorite.destroy
      render json: FavoriteSerializer.new(user_favorites)
    else
      unauthorized
    end
  end

private

  def current_user
    @user ||= User.find_by(api_key: params[:api_key])
  end

  def user_favorites
    current_user.favorites
  end

  def find_favorite
    current_user.favorites.find_by(location: format_location(params[:location]))
  end

  def add_favorite
    current_user.add_favorites(params[:location])
  end

  def unauthorized
    render body: 'Unauthorized', status: 401
  end

end
