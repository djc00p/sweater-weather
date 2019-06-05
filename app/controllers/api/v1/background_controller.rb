class Api::V1::BackgroundController < ApplicationController
  def index
    background_images = Background.new(background_params)
    render json: BackgroundImageSerializer.new(background_images)
  end

  private

  def background_params
    params.permit(:location)
  end
end
