module Straightedge
  module Figures
    # technically a label isn't even a figure, just a mark with an associated string
    class Label < Mark
      attr_reader :text
      
      def says(text)
	@text = text
	self
      end
    end
  end
end
