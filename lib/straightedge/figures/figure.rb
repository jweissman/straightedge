module Straightedge
  module Figures
    # TODO the idea is that a figure is a collection of marks (and possibly other figures...?)
    #       marks should be represented relative to the *figural* origin
    class Figure
      include Straightedge::Aspects::Colorable

      extend Forwardable
      include Enumerable

      def_delegators :marks, :each
      def_delegators :compass, :project
      def_delegators :location, :x, :y

      attr_accessor :marks, :color, :location

      def initialize(marks=[], location: nil, color: :none)
	@marks    = marks
	@color    = color
	@location = location
      end

      def compass; @compass ||= Straightedge::Toolkit::Compass.default end

      def adjacent
	approximate_adjacent = map(&method(:project)).flatten(1).uniq
	actual_adjacent = approximate_adjacent.reject(&method(:include?))
	actual_adjacent.sort_by(&method(:distance_from_center))
      end


      # note this is center of the collection of raw marks
      #      in terms of their own space; not displaced by location
      #      or scaled by dimensions
      def center
	[map(&:x).mean, map(&:y).mean]
      end

      def distance_from_center(xy)
	Straightedge::Toolkit::Ruler.distance(xy,center)
      end
    end
  end
end
