require "rails_helper"

RSpec.describe "As a user", :type => :request do
  it "favorite a location" do
    user = User.create(email: "user_1@email.com", password: 'password', api_key: SecureRandom.hex(32))

    allow_any_instance_of(BaseApiController).to  receive(:current_user).and_return(user)

    headers = {
      "ACCEPT" => "application/json",     # This is what Rails 4 accepts
      "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
    }
    post "/api/v1/favorites", :params => {:location => "Denver, CO", api_key: "#{user.api_key}"}, :headers => headers
    fav = FavoriteCity.last

    body =  {"data":{"id":"#{fav.id}","type":"favorite_cities","attributes":{"location":"Denver, CO","api_key":"#{user.api_key}"}}}

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(200)
    expect(response.body).to eq(body.to_json)
  end
end
