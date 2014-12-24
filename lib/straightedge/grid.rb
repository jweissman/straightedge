module Straightedge
  # TODO extend, make into just an arbitrary tiling Figure 
  #      so we can do sexy hexagons!
  #
  class Grid < Figure
    extend Forwardable
    include Enumerable

    def_delegator :lines, :x, :width
    def_delegator :lines, :y, :height

    DEFAULT_SIZE = 1_000

    def initialize(axes=[DEFAULT_SIZE,DEFAULT_SIZE])
      super([], lines: axes)
      @marks = Array.new(width) do |x|
	Array.new(height) do |y|
	  [x,y]
	end
      end.flatten(1)
    end

    def each
      @marks.each { |p| yield(p) }
    end

    def clip(xys=[])
      xys.reject do |xy|
	x,y = *xy
	x < 0 || y < 0 || x >= width || y >= height
      end 
    end
  end
end
