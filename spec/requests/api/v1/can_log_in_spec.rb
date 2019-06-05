require "rails_helper"

RSpec.describe "Returning user", :type => :request do
  it "returning user" do
    user = User.create(email: "user_1@email.com", password: 'password', api_key: SecureRandom.hex(32))

    headers = {
      "ACCEPT" => "application/json",     # This is what Rails 4 accepts
      "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
    }
    post "/api/v1/sessions", :params => {:email => "user_1@email.com", :password => 'password'}, :headers => headers

    body =  {
      "api_key": "#{user.api_key}",
    }

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(200)
    expect(response.body).to eq(body.to_json)
  end
end
