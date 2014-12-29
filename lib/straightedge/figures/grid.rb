module Straightedge
  module Figures
    class Grid < Figure #Quadrilateral
      include Enumerable
      def_delegators :to_a, :sample
      def_delegator :dimensions, :x, :width
      def_delegator :dimensions, :y, :height

      attr_reader :dimensions, :scale, :figure

      def initialize(dimensions=[], opts={})
	@dimensions = dimensions
	@scale      = opts.delete(:scale)  { 1.0 }
	@figure     = opts.delete(:figure) { Quadrilateral }
	super(to_a, opts)
      end

      def at(xy)
	[xy.x, xy.y]
      end

      def each
	Grid.each_coordinate([width, height]) do |x, y|
	  yield(at([x,y]))
	end
      end

      def clip(xys=[])
	xys.reject do |xy|
	  _x,_y = *xy
	  _x < 0 || _y < 0 || x >= _x || y >= _y
	end 
      end

      def self.each_coordinate(dimensions)
	dimensions.x.times do |x|
	  dimensions.y.times do |y|
	    yield [x,y]
	  end
	end
      end
    end
  end
end
