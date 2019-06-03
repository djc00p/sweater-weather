class Api::V1::AntipodeController < ApplicationController
  def index
    anitpode = Antipode.new(antipode_params).antipode_city
    render json: Anti
  end

  private

  def antipode_params
    params.permit(:loc)
  end
end
