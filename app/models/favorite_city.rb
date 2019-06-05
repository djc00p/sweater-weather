class FavoriteCity < ApplicationRecord
  belongs_to :user


  def self.favorite_city_weather(user)
    cities = where(user_id: user.id)
    cities.map do |city|
      Forecast.new(city)
    end
  end
end
