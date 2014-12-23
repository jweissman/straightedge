module Straightedge
  class Collection
    extend Forwardable
    def_delegators :points, :map, :include?
    def_delegator :compass, :project

    attr_reader :points
    attr_reader :points, :compass, :ruler

    def initialize(xys=[])
      @points = xys
      @compass   = Compass.default
      @ruler     = Ruler.default
    end

    def adjacent
      map(&method(:project)).flatten(1).uniq.reject(&method(:include?))
    end

    def center
      [map(&:x).mean, map(&:y).mean]
    end

    def distance_from_center(xy)
      Ruler.distance(xy,center)
    end
  end
end
