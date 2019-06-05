class BgImage
  attr_reader :id,
              :alt_description,
              :urls

  def initialize(attributes)
    @id = attributes[:id]
    @alt_description = attributes[:alt_description]
    @full_url = attributes[:urls][:full]
    @regular_url = attributes[:urls][:regular]
  end
end
