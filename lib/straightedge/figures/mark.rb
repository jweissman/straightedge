module Straightedge
  module Figures
    #
    # a mark is an optionally-colored position
    #
    class Mark
      include Straightedge::Aspects::Positional
      include Straightedge::Aspects::Colorable

      attr_reader :x, :y

      def initialize(*xy, color: :black)
	@x, @y = *xy
	@color = color
      end

      def self.empty(*xy); new(*xy, color: :none) end
    end
  end
end
