class Favorite < ApplicationRecord
  belongs_to :user
  # belongs_to :location
  validates :location, presence: true

  # delegates :city, to: :location
  # delegates :state, to: :location
  def current_weather
    facade = FavoriteFacade.new(location.downcase)
    facade.get_forecast(location)
  end
end

# In the action_controller

# def user_favorites
#   current_user.favorites.map do |favorite|
#     LocationWithWeather.new(favorite)
#   end
#
#   LocationWithWeather.new(location)
# end

# Decorator
# class LocationWithWeather < SimpleDelegator
#   def current_weather
#     facade = FavoriteFacade.new(location.downcase)
#     facade.get_forecast("#{city},#{state})
#   end
# end
