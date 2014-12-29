module Straightedge::Figures
  class Hexagon < Figure
    def initialize(scale=1.0, opts={})
      @orientation = opts.delete(:orientation) { :pointy }
    end

    protected
    def corners(scale)
      Array.new(6) do |i|
	angle = 2 * PI / 6 * i
	x_i = center_x + size * Math.cos(angle)
	y_i = center_y + size * Math.sin(angle)
	[x_i, y_i]
      end
    end
  end
end
