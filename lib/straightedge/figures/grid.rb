module Straightedge
  module Figures
    # TODO extend, make into just a tiling Figure 
    #      so we can choose between hexagons and rectangles
    #
    #      seems like grid @marks really should just be the inner marks...
    #
    #      yeah we really should break this down a little bit, hmm...
    #
    class Grid < Quadrilateral
      include Enumerable
      def_delegators :to_a, :sample

      attr_accessor :scale

      def at(xy)
	@inner_marks     ||= {}
	@inner_marks[xy] ||= Mark.new(*xy)
	@inner_marks[xy]
      end

      def each
	x.times do |_x|
	  y.times do |_y|
	    yield [_x,_y]
	  end
	end
      end

      def each_mark
	each do |xy|
	  yield(at(xy))
	end
      end

      def randomize_colors
	each_mark do |mark|
	  mark.paint Colors.pick
	end
	self
      end

      def clip(xys=[])
	xys.reject do |xy|
	  _x,_y = *xy
	  _x < 0 || _y < 0 || x >= _x || y >= _y
	end 
      end

      def self.reify_geometry(geometry=[], scale=1.0)
	[geometry.x/scale, geometry.y/scale]
      end

      def reify(xy)
	Grid.reify_geometry(xy, @scale)
      end

      #def self.dereference_coordinate(xy, scale=1.0)
      #  [xy.x / scale, xy.y / scale]
      #end
    end
  end
end
