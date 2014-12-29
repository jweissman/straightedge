module Straightedge::Aspects
  module Positional
    extend Forwardable
    # consider the entity as a vector in 2-space
    def to_point
      Straightedge::Mark.new(*self)
    end
    def_delegators :to_point, :x, :y
  end
end
