require "rails_helper"

RSpec.describe "Creating a new user", :type => :request do
  it "i should get a response with a key" do
    headers = {
      "ACCEPT" => "application/json",     # This is what Rails 4 accepts
      "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
    }
    post "/api/v1/users", :params => {:email => "user_1@email.com", :password => 'password', :password_confirmation => 'password'}, :headers => headers

    user = User.last

    body =  {"data":{"id":"#{user.id}","type":"user","attributes":{"api_key":"#{user.api_key}"}}}


    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(201)
    expect(response.body).to eq(body.to_json)
  end
end
