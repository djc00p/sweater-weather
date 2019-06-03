class AntipodeForecast
  attr_reader :summary,
              :current_temperature

  def initialize(attributes)
    @summary = attributes[:currently][:summary]
    @current_temperature = attributes[:currently][:temperature].to_i.to_s
  end
end
