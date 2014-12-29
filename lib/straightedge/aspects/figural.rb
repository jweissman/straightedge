module Straightedge::Aspects
  module Figural
    extend Forwardable

    # consider entity as a figure (collection of points)
    def to_points
      Straightedge::Figure.new(self)
    end
    def_delegators :to_points, :adjacent, :center

  end
end
