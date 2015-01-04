module Straightedge::Aspects
  module Colorable
    attr_reader :color
    def paint(c=Straightedge::Colors.pick)
      @color = c
    end

    def dim
      @color = Straightedge::Colors.hex_value(@color) - 0x4B4B4B4B
    end
  end
end
