module Straightedge
  module Figures
    # TODO extend, make into just a tiling Figure 
    #      so we can choose between hexagons and rectangles
    #
    class Grid < Quadrilateral
      include Enumerable

      def_delegators :to_a, :sample

      def each
	x.times do |_x|
	  y.times do |_y|
	    yield [_x,_y]
	  end
	end
      end

      def clip(xys=[])
	xys.reject do |xy|
	  _x,_y = *xy
	  _x < 0 || _y < 0 || x >= _x || y >= _y
	end 
      end
    end
  end
end
