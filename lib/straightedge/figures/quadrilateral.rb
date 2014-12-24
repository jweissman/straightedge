module Straightedge
  module Figures
    class Quadrilateral < Figure
      def_delegators :dimensions, :x, :y
      def dimensions
	# try to sensibly handle the case where we 
	# are just given a single-dimensional array
	if @marks.first.is_a?(Array)
	  @marks.first
	else
	  @marks #.first
	end
      end
    end
  end
end
