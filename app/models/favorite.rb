class Favorite < ApplicationRecord
  belongs_to :user
  validates :location, presence: true

  def current_weather
    facade = FavoriteFacade.new(location.downcase)
    facade.get_forecast(location)
  end
end
