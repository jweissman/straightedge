module Straightedge
  module Figures
    class Line < Figure
      def alpha
	@marks[0]
      end

      def beta
	@marks[1]
      end

      def dx
	alpha.x - beta.x
      end

      def dy
	alpha.y - beta.y
      end

      def length
	Math.sqrt(dx*dx + dy*dy)
      end
    end
  end
end
