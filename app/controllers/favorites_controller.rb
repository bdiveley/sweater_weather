class FavoritesController < ApplicationController

  def index
    current_user = User.find_by(api_key: params[:api_key])
    render json: UserFavoriteSerializer.new(current_user.favorites)
  end


end
