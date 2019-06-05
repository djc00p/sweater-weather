class Api::V1::UserController < BaseApiController

  def create
    new_user = User.new(user_params)
    new_user[:api_key] = key
    if new_user.save
      session[:user_id] = new_user.id
      render json: UserSerializer.new(new_user), status: 201
    end
  end

  private

  def user_params
    params.permit(:email,:password,:password_confirmation)
  end

  def key
    SecureRandom.hex(32)
  end
end
