require "rails_helper"

RSpec.describe "As a user" do
  it "favorite a location list" do
    user = User.create(email: "user_1@email.com", password: 'password', api_key: SecureRandom.hex(32))

    fav_city1 = FavoriteCity.create(location: 'Denver, CO', user_id: user.id)


    allow_any_instance_of(BaseApiController).to  receive(:current_user).and_return(user)

    headers = {
      "ACCEPT" => "application/json",     # This is what Rails 4 accepts
      "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
    }
    get "/api/v1/favorites", :params => {:location => "Denver, CO", api_key: "#{user.api_key}"}, :headers => headers

    expect(response).to be_successful
  end
end
