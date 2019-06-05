class Api::V1::SessionController < BaseApiController
  def create
    user = User.find_by(email: params[:email])
    render json: {api_key: user[:api_key] }
  end
end
