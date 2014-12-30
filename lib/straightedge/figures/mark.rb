module Straightedge
  module Figures
    #
    # a mark is an optionally-colored position
    #
    class Mark
      extend Forwardable
      include Straightedge::Aspects::Colorable

      attr_accessor :location

      def initialize(*xy, color: :white)
	@location = xy # [xy[0], xy[1]]
	@color = color
      end

      def x; @location[0] end
      def y; @location[1] end

      def self.empty(*xy); new(*xy, color: :none) end
    end
  end
end
