module Straightedge::Figures
  class Hexagon < Figure
    attr_reader :dimensions
    def_delegator :dimensions, :x, :width
    def_delegator :dimensions, :y, :height

    def initialize(location: ORIGIN, color: :white, scale: 1.0)
      super(location: location, color: color)
      @scale      = scale
      @dimensions = dimensions
      @marks      = corners
    end

    # nb except for this identical to quad
    def corners #(scale=@scale)
      Array.new(6) do |i|
	angle = 2 * Math::PI / 6 * i
	x_i = x + scale * Math.cos(angle)
	y_i = y + scale * Math.sin(angle)
	[x_i, y_i]
      end
    end
  end
end
