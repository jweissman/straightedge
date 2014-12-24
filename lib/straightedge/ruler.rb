module Straightedge
  class Ruler
    def initialize(unit=1)
      @unit = unit
    end

    class << self
      def default; @default ||= new end

      def translate(xy, dxy)
        xy.zip(dxy).map { |x,y| x+y }
      end

      def distance(alpha,beta)
	Line.new([alpha,beta]).length
	#dx, dy = alpha.x - beta.x, alpha.y - beta.y
	#Math.sqrt(dx*dx + dy*dy)
      end
    end
  end
end
