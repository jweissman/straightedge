module Straightedge
  #
  # a mark is an "indicated" point with an optional color
  # the idea is for it to be a thin wrapper around the 
  # vector arrays that are going to be so common
  #
  # so calling .to_point on an array will give you a mark
  # and hence #x/#y accessors (equivalently #width/#height)
  # on simple vectors
  #
  # where you could instantiate a mark, try to just use 
  # a vector and push the calculation as far west as
  # possible
  #
  class Mark
    attr_reader :color, :x, :y

    alias :width :x
    alias :height :y

    def initialize(*args,color: :black)
      @x, @y = *args # x, y
      @color = color
    end
  end
end
