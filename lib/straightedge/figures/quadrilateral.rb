module Straightedge
  module Figures
    class Quadrilateral < Figure
      attr_reader :dimensions
      def_delegator :dimensions, :x, :width
      def_delegator :dimensions, :y, :height

      def initialize(dimensions: [1,1], location: ORIGIN, color: :white)
	super([], location: location, color: color)
	@dimensions = dimensions
	@marks      = corners
      end

      def corners(w=width, h=height)
	@corners ||= [[x,y],[x,y+h],[x+w,y+h],[x+w,y]]
	#Rose.simple.project(origin).map { |xy| [xy.x*w, xy.y*h] }
      end
    end
  end
end
