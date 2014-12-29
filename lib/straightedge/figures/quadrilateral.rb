module Straightedge
  module Figures
    class Quadrilateral < Figure
      attr_reader :dimensions
      def_delegator :dimensions, :x, :width
      def_delegator :dimensions, :y, :height

      def initialize(dimensions=[1,1], location: [0,0], color: :white)
	super([], location: location, color: color)
	@dimensions = dimensions
	@marks      = corners
      end

      protected
      def corners(w=width,h=height)
	[[x,y],[x,y+w],[x+h,y],[x+w,y+h]]
	#Rose.simple.project(origin).map { |xy| [xy.x*w, xy.y*h] }
      end
    end
  end
end
