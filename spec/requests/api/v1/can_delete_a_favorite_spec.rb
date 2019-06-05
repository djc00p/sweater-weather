require "rails_helper"

RSpec.describe "As a user", :type => :request do
  it "cann delete favorite a location" do
    user = User.create(email: "user_1@email.com", password: 'password', api_key: SecureRandom.hex(32))

    fav_city1 = FavoriteCity.create(location: 'Denver, CO', user_id: user.id)

    allow_any_instance_of(BaseApiController).to  receive(:current_user).and_return(user)

    headers = {
      "ACCEPT" => "application/json",     # This is what Rails 4 accepts
      "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
    }
    delete "/api/v1/favorites", :params => {:location => "Denver, CO"}, :headers => headers

    fav = FavoriteCity.last

    body = "Successfully deleted #{fav_city1[:location]}"

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(200)
    expect(response.body).to eq(body)
  end
end
