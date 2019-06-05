class  Api::V1::FavoriteController < BaseApiController
  def index
    fav_cities = FavoriteCity.favorite_city_weather(current_user)
    render json: FavoriteForecastSerializer.new(fav_cities)
  end

  def create
    user = current_user
    favorite_city = FavoriteCity.new(favorite_params)
    favorite_city[:user_id] = user.id
    if favorite_city.save
      render json: FavoriteCitiesSerializer.new(favorite_city)
    else
      render 'public/404.html'
    end
  end

  def delete
    fav_city = current_user.favorite_cities.find_by(location: params[:location])
    fav_cities = FavoriteCity.favorite_city_weather(current_user)
    if fav_city.delete
      render json: "Successfully deleted #{fav_city[:location]}"
    end
  end

  private

  def favorite_params
    params.permit(:location, :user_id)
  end
end
