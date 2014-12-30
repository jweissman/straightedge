module Straightedge::Figures
  class Hexagon < Figure
    attr_accessor :scale

    def initialize(location: Straightedge::ORIGIN, color: :white, scale: 1.0)
      super(location: location, color: color)
      @scale      = scale
      #@dimensions = dimensions
      @marks      = corners
    end

    def left_triangle
      corners[0..2] #.cycle.ip.take(3)
    end

    def right_triangle
      corners[3..5]
    end

    def center_quad
      [corners[0], corners[2], corners[3], corners[5]]
    end

    # nb except for this identical to quad
    def corners #(scale=@scale)
      Array.new(6) do |i|
	angle = 2 * Math::PI / 6 * (i+2)
	x_i = x + scale * Math.cos(angle)
	y_i = y + scale * Math.sin(angle)
	[x_i, y_i]
      end
    end
  end
end
