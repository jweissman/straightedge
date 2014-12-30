module Straightedge
  module Figures
    class Grid < Figure
      include Enumerable
      def_delegators :to_a, :sample, :map!
      def_delegator :dimensions, :x, :width
      def_delegator :dimensions, :y, :height

      attr_reader :dimensions, :scale, :figure

      def initialize(dimensions=[1,1], opts={})
	@dimensions = dimensions
	@scale      = opts.delete(:scale)  { 1.0 }
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

      def to_pixels(xy)
	[xy.x * @scale, xy.y * @scale]
      end

      def to_coords(xy)
	[xy.x / @scale, xy.y / @scale ]
      end
    end
  end
end
