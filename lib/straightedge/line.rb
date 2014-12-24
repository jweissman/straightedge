module Straightedge
  class Line
    attr_reader :color, :alpha, :beta
    def initialize(a,b,color=:black)
      @alpha, @beta = a, b
      @color = color
    end

    def dx
      @alpha.x - @beta.x
    end

    def dy
      @alpha.y - @beta.y
    end

    def length
      Math.sqrt(dx*dx + dy*dy)
    end
  end
end
