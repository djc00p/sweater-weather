class Background
  attr_reader :id
  def initialize(location)
    @id = 1
    @location = location
  end

  def background_images
    background_image_service.map do |image|
      BgImage.new(image)
    end
  end

  private


  def background_image_service
    @_image_service ||= UnsplashService.new(@location).background_images
  end
end
