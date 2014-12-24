module Straightedge
  # TODO the idea is that a figure is a collection of lines and marks
  class Figure
    extend Forwardable
    def_delegators :marks, :each, :sample, :flatten, :to_a, :include?
    def_delegator :compass, :project
    attr_reader :lines, :marks
    attr_reader :compass

    def initialize(marks=[], lines: [], compass: Compass.default)
      @marks = marks
      @lines = lines
      @compass = compass
    end

    def adjacent
      @marks.map(&method(:project)).flatten(1).uniq.reject(&method(:include?))
    end

    def center
      [@marks.map(&:x).mean, @marks.map(&:y).mean]
    end

    def distance_from_center(xy)
      Ruler.distance(xy,center)
    end
  end
end
