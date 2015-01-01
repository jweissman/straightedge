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

      # over-ride with data
      def color_at(_); :none end 
      def cell_at(xy)
	@cells     ||= {}
	@cells[xy] = Figures::Quadrilateral.new(color: color_at(xy), dimensions: [@scale, @scale], location: to_pixels(xy))
      end

      def each_cell
	each { |xy| yield cell_at(xy) }
      end

      def paint!
        #each(&:to_point)
	each_cell(&:paint)
      end

      def clip(xys=[])
	xys.reject do |xy|
	  _x, _y = xy.x, xy.y
	  _x < 0 || _y < 0 || width >= _x || height >= _y
	end 
      end

      def self.each_coordinate(dim)
	dim.x.times do |x|
	  dim.y.times do |y|
	    yield [x,y]
	  end
	end
      end

      # why scale/2? there's something goofy somewhere
      def to_pixels(xy)
	[xy.x * (@scale/2), xy.y * (@scale/2)]
      end

      #def to_coords(xy)
      #  [xy.x / (@scale/2), xy.y / (@scale/2) ]
      #end
    end
  end
end
