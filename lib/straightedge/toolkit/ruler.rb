module Straightedge
  module Toolkit
    class Ruler
      attr_reader :unit

      def initialize(unit: 1)
	@unit = unit
      end

      class << self
	def default; @default ||= new end

	def translate(xy, dxy)
	  xy.zip(dxy).map { |x,y| x+y }
	end

	def distance(alpha,beta)
	  Straightedge::Figures::Line.new([alpha,beta]).length
	end
      end
    end
  end
end
