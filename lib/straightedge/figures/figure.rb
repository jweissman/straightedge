module Straightedge
  module Figures
    # TODO the idea is that a figure is a collection of marks (and possible other figures...)
    #      in itself a figure does not have a location
    class Figure
      extend Forwardable
      include Enumerable

      def_delegators :marks, :each
      def_delegator :compass, :project

      attr_reader :lines, :marks
      attr_reader :compass

      def initialize(marks=[], color: :black, lines: [], compass: Straightedge::Toolkit::Compass.default)
	@marks = marks
	@lines = lines
	@color = color
	@compass = compass
      end

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
