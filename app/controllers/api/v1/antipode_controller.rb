class Api::V1::AntipodeController < ApplicationController
  def index
    anitpode = Antipode.new(antipode_params)
    render json: AntipodeSerializer.new([anitpode])
  end

  private

  def antipode_params
    params.permit(:loc)
  end
end
