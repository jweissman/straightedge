module Straightedge::Aspects
  module Colorable
    attr_reader :color
    def paint(c=Colors.pick)
      @color = c
    end
  end
end
