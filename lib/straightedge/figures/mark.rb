module Straightedge
  module Figures
    #
    # a mark is an optionally-colored position
    #
    class Mark
      include Straightedge::Aspects::Positional

      attr_reader :color, :x, :y

      def initialize(*xy, color: :black)
	@x, @y = *xy
	@color = color
      end

      # i don't think this is actually used :)
      def dimensions
	[0,0] 
      end

      def paint(color=Colors.pick)
	@color = color 
      end

      def self.empty(*xy); new(*xy, color: :none) end
    end
  end
end
