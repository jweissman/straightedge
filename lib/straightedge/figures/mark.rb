module Straightedge
  module Figures
    class Mark
      attr_reader :color, :x, :y

      alias :width :x
      alias :height :y

      def initialize(*xy, color: :black)
	@x, @y = *xy
	@color = color
      end

      def paint(color); @color = color end

      def self.empty(*xy); new(*xy, color: :none) end
    end
  end
end
